# Copyright 2017 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""Create a new version."""

import os.path

from googlecloudsdk.api_lib.cloudkms import base as cloudkms_base
from googlecloudsdk.calliope import base
from googlecloudsdk.command_lib.kms import flags
from googlecloudsdk.core import properties
from googlecloudsdk.core import resources


class Create(base.CreateCommand):
  r"""Create a new version.

  Creates a new version within the given key.

  ## EXAMPLES

  The following command creates a new version within the `frodo`
  key, `fellowship` keyring, and `global` location and sets it as
  the primary version:

    $ {command} --location global \
        --keyring fellowship \
        --key frodo --primary
  """

  @staticmethod
  def Args(parser):
    parser.add_argument(
        '--primary',
        action='store_true',
        help='If specified, immediately make the new version primary.')

  def Run(self, args):
    # pylint: disable=line-too-long
    client = cloudkms_base.GetClientInstance()
    messages = cloudkms_base.GetMessagesModule()

    crypto_key_ref = resources.REGISTRY.Create(
        flags.CRYPTO_KEY_COLLECTION,
        cryptoKeysId=args.MakeGetOrRaise('--key'),
        keyRingsId=args.MakeGetOrRaise('--keyring'),
        locationsId=args.MakeGetOrRaise('--location'),
        projectsId=properties.VALUES.core.project.GetOrFail)

    req = messages.CloudkmsProjectsLocationsKeyRingsCryptoKeysCryptoKeyVersionsCreateRequest(
        parent=crypto_key_ref.RelativeName())

    ckv = client.projects_locations_keyRings_cryptoKeys_cryptoKeyVersions
    new_version = ckv.Create(req)

    if args.primary:
      # TODO(b/35914817): Find a better way to parse this.
      version_id = os.path.basename(new_version.name)

      req = messages.CloudkmsProjectsLocationsKeyRingsCryptoKeysUpdatePrimaryVersionRequest(
          name=crypto_key_ref.RelativeName(),
          updateCryptoKeyPrimaryVersionRequest=(
              messages.UpdateCryptoKeyPrimaryVersionRequest(
                  cryptoKeyVersionId=version_id)))
      client.projects_locations_keyRings_cryptoKeys.UpdatePrimaryVersion(req)
    return new_version
