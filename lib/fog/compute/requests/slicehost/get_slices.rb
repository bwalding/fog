module Fog
  module Compute
    class Slicehost
      class Real

        require 'fog/compute/parsers/slicehost/get_slices'

        # Get list of slices
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Array>:
        #     * 'addresses'<~Array> - Ip addresses for the slice
        #     * 'backup-id'<~Integer> - Id of backup slice was booted from
        #     * 'bw-in'<~Float> - Incoming bandwidth total for current billing cycle, in Gigabytes
        #     * 'bw-out'<~Float> - Outgoing bandwidth total for current billing cycle, in Gigabytes
        #     * 'flavor_id'<~Integer> - Id of flavor slice was booted from
        #     * 'id'<~Integer> - Id of the slice
        #     * 'image-id'<~Integer> - Id of image slice was booted from
        #     * 'name'<~String> - Name of the slice
        #     * 'progress'<~Integer> - Progress of current action, in percentage
        #     * 'status'<~String> - Current status of the slice
        def get_slices
          request(
            :expects  => 200,
            :method   => 'GET',
            :parser   => Fog::Parsers::Compute::Slicehost::GetSlices.new,
            :path     => 'slices.xml'
          )
        end

      end
    end
  end
end
