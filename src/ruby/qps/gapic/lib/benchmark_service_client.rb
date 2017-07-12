# Copyright 2017, Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# EDITING INSTRUCTIONS
# This file was generated from the file
# https://github.com/googleapis/googleapis/blob/master/src/proto/grpc/testing/services.proto,
# and updates to that file get reflected here through a refresh process.
# For the short term, the refresh process will only be runnable by Google
# engineers.
#
# The only allowed edits are to method and file documentation. A 3-way
# merge preserves those additions if the generated source changes.

require "json"
require "pathname"

require "google/gax"

require 'src/proto/grpc/testing/services_services_pb'

module Benchmark
  # @!attribute [r] benchmark_service_stub
  #   @return [Grpc::Testing::BenchmarkService::Stub]
  class BenchmarkServiceClient
    attr_reader :benchmark_service_stub

    # The default address of the service.
    SERVICE_ADDRESS = "testing.googleapis.com".freeze

    # The default port of the service.
    DEFAULT_SERVICE_PORT = 443

    DEFAULT_TIMEOUT = 30

    # The scopes needed to make gRPC calls to all of the methods defined in
    # this service.
    ALL_SCOPES = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/pubsub"
    ].freeze

    # @param service_path [String]
    #   The domain name of the API remote host.
    # @param port [Integer]
    #   The port on which to connect to the remote host.
    # @param channel [Channel]
    #   A Channel object through which to make calls.
    # @param chan_creds [Grpc::ChannelCredentials]
    #   A ChannelCredentials for the setting up the RPC client.
    # @param updater_proc [Proc]
    #   A function that transforms the metadata for requests, e.g., to give
    #   OAuth credentials.
    # @param scopes [Array<String>]
    #   The OAuth scopes for this service. This parameter is ignored if
    #   an updater_proc is supplied.
    # @param client_config[Hash]
    #   A Hash for call options for each method. See
    #   Google::Gax#construct_settings for the structure of
    #   this data. Falls back to the default config if not specified
    #   or the specified config is missing data points.
    # @param timeout [Numeric]
    #   The default timeout, in seconds, for calls made through this client.
    def initialize \
        service_path: SERVICE_ADDRESS,
        port: DEFAULT_SERVICE_PORT,
        channel: nil,
        chan_creds: nil,
        updater_proc: nil,
        scopes: ALL_SCOPES,
        client_config: {},
        timeout: DEFAULT_TIMEOUT,
        app_name: nil,
        app_version: nil,
        lib_name: nil,
        lib_version: ""
      # These require statements are intentionally placed here to initialize
      # the gRPC module only when it's required.
      # See https://github.com/googleapis/toolkit/issues/446
      require "google/gax/grpc"
      require "src/proto/grpc/testing/services_services_pb"


      if app_name || app_version
        warn "`app_name` and `app_version` are no longer being used in the request headers."
      end

      google_api_client = "gl-ruby/#{RUBY_VERSION}"
      google_api_client << " #{lib_name}/#{lib_version}" if lib_name
      google_api_client << " gapic/0.6.8 gax/#{Google::Gax::VERSION}"
      google_api_client << " grpc/#{GRPC::VERSION}"
      google_api_client.freeze

      headers = { :"x-goog-api-client" => google_api_client }
      client_config_file = Pathname.new(__dir__).join(
        "benchmark_service_client_config.json"
      )
      defaults = client_config_file.open do |f|
        Google::Gax.construct_settings(
          "grpc.testing.BenchmarkService",
          JSON.parse(f.read),
          client_config,
          Google::Gax::Grpc::STATUS_CODE_NAMES,
          timeout,
          errors: Google::Gax::Grpc::API_ERRORS,
          kwargs: headers
        )
      end
      @benchmark_service_stub = Google::Gax::Grpc.create_stub(
        service_path,
        port,
        chan_creds: chan_creds,
        channel: channel,
        updater_proc: updater_proc,
        scopes: scopes,
        &Grpc::Testing::BenchmarkService::Stub.method(:new)
      )

      @unary_call = Google::Gax.create_api_call(
        @benchmark_service_stub.method(:unary_call),
        defaults["unary_call"]
      )
      @streaming_call = Google::Gax.create_api_call(
        @benchmark_service_stub.method(:streaming_call),
        defaults["streaming_call"]
      )
      # @streaming_from_client = Google::Gax.create_api_call(
      #   @benchmark_service_stub.method(:streaming_from_client),
      #   defaults["streaming_from_client"]
      # )
      # @streaming_from_server = Google::Gax.create_api_call(
      #   @benchmark_service_stub.method(:streaming_from_server),
      #   defaults["streaming_from_server"]
      # )
      # @streaming_both_ways = Google::Gax.create_api_call(
      #   @benchmark_service_stub.method(:streaming_both_ways),
      #   defaults["streaming_both_ways"]
      # )
    end

    # Service calls

    # One request followed by one response.
    # The server returns the client payload as-is.
    #
    # @param response_type [Grpc::Testing::PayloadType]
    #   DEPRECATED, don't use. To be removed shortly.
    #   Desired payload type in the response from the server.
    #   If response_type is RANDOM, server randomly chooses one from other formats.
    # @param response_size [Integer]
    #   Desired payload size in the response from the server.
    # @param payload [Grpc::Testing::Payload | Hash]
    #   Optional input payload sent along with the request.
    #   A hash of the same form as `Grpc::Testing::Payload`
    #   can also be provided.
    # @param fill_username [true, false]
    #   Whether SimpleResponse should include username.
    # @param fill_oauth_scope [true, false]
    #   Whether SimpleResponse should include OAuth scope.
    # @param response_compressed [Grpc::Testing::BoolValue | Hash]
    #   Whether to request the server to compress the response. This field is
    #   "nullable" in order to interoperate seamlessly with clients not able to
    #   implement the full compression tests by introspecting the call to verify
    #   the response's compression status.
    #   A hash of the same form as `Grpc::Testing::BoolValue`
    #   can also be provided.
    # @param response_status [Grpc::Testing::EchoStatus | Hash]
    #   Whether server should return a given status
    #   A hash of the same form as `Grpc::Testing::EchoStatus`
    #   can also be provided.
    # @param expect_compressed [Grpc::Testing::BoolValue | Hash]
    #   Whether the server should expect this request to be compressed.
    #   A hash of the same form as `Grpc::Testing::BoolValue`
    #   can also be provided.
    # @param options [Google::Gax::CallOptions]
    #   Overrides the default settings for this call, e.g, timeout,
    #   retries, etc.
    # @return [Grpc::Testing::SimpleResponse]
    # @raise [Google::Gax::GaxError] if the RPC is aborted.
    # @example
    #   require ""
    #
    #   benchmark_service_client = ::BenchmarkServiceClient.new
    #   response = benchmark_service_client.unary_call

    def unary_call \
        response_type: nil,
        response_size: nil,
        payload: nil,
        fill_username: nil,
        fill_oauth_scope: nil,
        response_compressed: nil,
        response_status: nil,
        expect_compressed: nil,
        options: nil
      req = {
        response_type: response_type,
        response_size: response_size,
        payload: payload,
        fill_username: fill_username,
        fill_oauth_scope: fill_oauth_scope,
        response_compressed: response_compressed,
        response_status: response_status,
        expect_compressed: expect_compressed
      }.delete_if { |_, v| v.nil? }
      req = Google::Gax::to_proto(req, Grpc::Testing::SimpleRequest)
      @unary_call.call(req, options)
    end

    def unary_call_req(req)

      # req = Google::Gax::to_proto(req, Grpc::Testing::SimpleRequest)
      @unary_call.call(req, nil)
    end

    # Repeated sequence of one request followed by one response.
    # Should be called streaming ping-pong
    # The server returns the client payload as-is on each response
    #
    # @param reqs [Enumerable<Grpc::Testing::SimpleRequest>]
    #   The input requests.
    # @param options [Google::Gax::CallOptions]
    #   Overrides the default settings for this call, e.g, timeout,
    #   retries, etc.
    # @return [Enumerable<Grpc::Testing::SimpleResponse>]
    #   An enumerable of Grpc::Testing::SimpleResponse instances.
    #
    # @raise [Google::Gax::GaxError] if the RPC is aborted.
    #
    # @note
    #   EXPERIMENTAL:
    #     Streaming requests are still undergoing review.
    #     This method interface might change in the future.
    #
    # @example
    #   require ""
    #
    #   benchmark_service_client = ::BenchmarkServiceClient.new
    #   request = {}
    #   requests = [request]
    #   benchmark_service_client.streaming_call(requests).each do |element|
    #     # Process element.
    #   end

    def streaming_call reqs, options: nil
      @streaming_call.call(reqs, options)
    end

    # # Single-sided unbounded streaming from client to server
    # # The server returns the client payload as-is once the client does WritesDone
    # #
    # # @param reqs [Enumerable<Grpc::Testing::SimpleRequest>]
    # #   The input requests.
    # # @param options [Google::Gax::CallOptions]
    # #   Overrides the default settings for this call, e.g, timeout,
    # #   retries, etc.
    # # @return [Grpc::Testing::SimpleResponse]
    # # @raise [Google::Gax::GaxError] if the RPC is aborted.
    # #
    # # @note
    # #   EXPERIMENTAL:
    # #     Streaming requests are still undergoing review.
    # #     This method interface might change in the future.
    # #
    # # @example
    # #   require ""
    # #
    # #   benchmark_service_client = ::BenchmarkServiceClient.new
    # #   request = {}
    # #   requests = [request]
    # #   response = benchmark_service_client.streaming_from_client(requests)
    #
    # def streaming_from_client reqs, options: nil
    #   @streaming_from_client.call(reqs, options)
    # end
    #
    # # Single-sided unbounded streaming from server to client
    # # The server repeatedly returns the client payload as-is
    # #
    # # @param response_type [Grpc::Testing::PayloadType]
    # #   DEPRECATED, don't use. To be removed shortly.
    # #   Desired payload type in the response from the server.
    # #   If response_type is RANDOM, server randomly chooses one from other formats.
    # # @param response_size [Integer]
    # #   Desired payload size in the response from the server.
    # # @param payload [Grpc::Testing::Payload | Hash]
    # #   Optional input payload sent along with the request.
    # #   A hash of the same form as `Grpc::Testing::Payload`
    # #   can also be provided.
    # # @param fill_username [true, false]
    # #   Whether SimpleResponse should include username.
    # # @param fill_oauth_scope [true, false]
    # #   Whether SimpleResponse should include OAuth scope.
    # # @param response_compressed [Grpc::Testing::BoolValue | Hash]
    # #   Whether to request the server to compress the response. This field is
    # #   "nullable" in order to interoperate seamlessly with clients not able to
    # #   implement the full compression tests by introspecting the call to verify
    # #   the response's compression status.
    # #   A hash of the same form as `Grpc::Testing::BoolValue`
    # #   can also be provided.
    # # @param response_status [Grpc::Testing::EchoStatus | Hash]
    # #   Whether server should return a given status
    # #   A hash of the same form as `Grpc::Testing::EchoStatus`
    # #   can also be provided.
    # # @param expect_compressed [Grpc::Testing::BoolValue | Hash]
    # #   Whether the server should expect this request to be compressed.
    # #   A hash of the same form as `Grpc::Testing::BoolValue`
    # #   can also be provided.
    # # @param options [Google::Gax::CallOptions]
    # #   Overrides the default settings for this call, e.g, timeout,
    # #   retries, etc.
    # # @return [Enumerable<Grpc::Testing::SimpleResponse>]
    # #   An enumerable of Grpc::Testing::SimpleResponse instances.
    # #
    # # @raise [Google::Gax::GaxError] if the RPC is aborted.
    # # @example
    # #   require ""
    # #
    # #   benchmark_service_client = ::BenchmarkServiceClient.new
    # #   benchmark_service_client.streaming_from_server.each do |element|
    # #     # Process element.
    # #   end
    #
    # def streaming_from_server \
    #     response_type: nil,
    #     response_size: nil,
    #     payload: nil,
    #     fill_username: nil,
    #     fill_oauth_scope: nil,
    #     response_compressed: nil,
    #     response_status: nil,
    #     expect_compressed: nil,
    #     options: nil
    #   req = {
    #     response_type: response_type,
    #     response_size: response_size,
    #     payload: payload,
    #     fill_username: fill_username,
    #     fill_oauth_scope: fill_oauth_scope,
    #     response_compressed: response_compressed,
    #     response_status: response_status,
    #     expect_compressed: expect_compressed
    #   }.delete_if { |_, v| v.nil? }
    #   req = Google::Gax::to_proto(req, Grpc::Testing::SimpleRequest)
    #   @streaming_from_server.call(req, options)
    # end
    #
    # # Two-sided unbounded streaming between server to client
    # # Both sides send the content of their own choice to the other
    # #
    # # @param reqs [Enumerable<Grpc::Testing::SimpleRequest>]
    # #   The input requests.
    # # @param options [Google::Gax::CallOptions]
    # #   Overrides the default settings for this call, e.g, timeout,
    # #   retries, etc.
    # # @return [Enumerable<Grpc::Testing::SimpleResponse>]
    # #   An enumerable of Grpc::Testing::SimpleResponse instances.
    # #
    # # @raise [Google::Gax::GaxError] if the RPC is aborted.
    # #
    # # @note
    # #   EXPERIMENTAL:
    # #     Streaming requests are still undergoing review.
    # #     This method interface might change in the future.
    # #
    # # @example
    # #   require ""
    # #
    # #   benchmark_service_client = ::BenchmarkServiceClient.new
    # #   request = {}
    # #   requests = [request]
    # #   benchmark_service_client.streaming_both_ways(requests).each do |element|
    # #     # Process element.
    # #   end
    #
    # def streaming_both_ways reqs, options: nil
    #   @streaming_both_ways.call(reqs, options)
    # end
  end
end
