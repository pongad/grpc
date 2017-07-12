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

require "minitest/autorun"
require "minitest/spec"

require "google/gax"

require "/benchmark_service_client"
require "src/proto/grpc/testing/services_services_pb"

class CustomTestError < StandardError; end

# Mock for the GRPC::ClientStub class.
class MockGrpcClientStub

  # @param expected_symbol [Symbol] the symbol of the grpc method to be mocked.
  # @param mock_method [Proc] The method that is being mocked.
  def initialize(expected_symbol, mock_method)
    @expected_symbol = expected_symbol
    @mock_method = mock_method
  end

  # This overrides the Object#method method to return the mocked method when the mocked method
  # is being requested. For methods that aren't being tested, this method returns a proc that
  # will raise an error when called. This is to assure that only the mocked grpc method is being
  # called.
  #
  # @param symbol [Symbol] The symbol of the method being requested.
  # @return [Proc] The proc of the requested method. If the requested method is not being mocked
  #   the proc returned will raise when called.
  def method(symbol)
    return @mock_method if symbol == @expected_symbol

    # The requested method is not being tested, raise if it called.
    proc do
      raise "The method #{symbol} was unexpectedly called during the " \
        "test for #{@expected_symbol}."
    end
  end
end

describe ::BenchmarkServiceClient do

  describe 'unary_call' do
    custom_error = CustomTestError.new "Custom test error for ::BenchmarkServiceClient#unary_call."

    it 'invokes unary_call without error' do
      # Create expected grpc response
      username = "username-265713450"
      oauth_scope = "oauthScope443818668"
      expected_response = { username: username, oauth_scope: oauth_scope }
      expected_response = Google::Gax::to_proto(expected_response, Grpc::Testing::SimpleResponse)

      # Mock Grpc layer
      mock_method = proc do
        expected_response
      end
      mock_stub = MockGrpcClientStub.new(:unary_call, mock_method)

      Grpc::Testing::BenchmarkService::Stub.stub(:new, mock_stub) do
        client = ::BenchmarkServiceClient.new

        # Call method
        response = client.unary_call

        # Verify the response
        assert_equal(expected_response, response)
      end
    end

    it 'invokes unary_call with error' do
      # Mock Grpc layer
      mock_method = proc do
        raise custom_error
      end
      mock_stub = MockGrpcClientStub.new(:unary_call, mock_method)

      Grpc::Testing::BenchmarkService::Stub.stub(:new, mock_stub) do
        client = ::BenchmarkServiceClient.new

        # Call method
        err = assert_raises Google::Gax::GaxError do
          client.unary_call
        end

        # Verify the GaxError wrapped the custom error that was raised.
        assert_match(custom_error.message, err.message)
      end
    end
  end

  describe 'streaming_call' do
    custom_error = CustomTestError.new "Custom test error for ::BenchmarkServiceClient#streaming_call."

    it 'invokes streaming_call without error' do
      # Create request parameters
      request = {}

      # Create expected grpc response
      username = "username-265713450"
      oauth_scope = "oauthScope443818668"
      expected_response = { username: username, oauth_scope: oauth_scope }
      expected_response = Google::Gax::to_proto(expected_response, Grpc::Testing::SimpleResponse)

      # Mock Grpc layer
      mock_method = proc do |requests|
        request = requests.first
        [expected_response]
      end
      mock_stub = MockGrpcClientStub.new(:streaming_call, mock_method)

      Grpc::Testing::BenchmarkService::Stub.stub(:new, mock_stub) do
        client = ::BenchmarkServiceClient.new

        # Call method
        response = client.streaming_call([request])

        # Verify the response
        assert_equal(1, response.count)
        assert_equal(expected_response, response.first)
      end
    end

    it 'invokes streaming_call with error' do
      # Create request parameters
      request = {}

      # Mock Grpc layer
      mock_method = proc do |requests|
        raise custom_error
      end
      mock_stub = MockGrpcClientStub.new(:streaming_call, mock_method)

      Grpc::Testing::BenchmarkService::Stub.stub(:new, mock_stub) do
        client = ::BenchmarkServiceClient.new

        # Call method
        err = assert_raises Google::Gax::GaxError do
          client.streaming_call([request])
        end

        # Verify the GaxError wrapped the custom error that was raised.
        assert_match(custom_error.message, err.message)
      end
    end
  end

  describe 'streaming_from_client' do
    custom_error = CustomTestError.new "Custom test error for ::BenchmarkServiceClient#streaming_from_client."

    it 'invokes streaming_from_client without error' do
      # Create request parameters
      request = {}

      # Create expected grpc response
      username = "username-265713450"
      oauth_scope = "oauthScope443818668"
      expected_response = { username: username, oauth_scope: oauth_scope }
      expected_response = Google::Gax::to_proto(expected_response, Grpc::Testing::SimpleResponse)

      # Mock Grpc layer
      mock_method = proc do |requests|
        request = requests.first
        expected_response
      end
      mock_stub = MockGrpcClientStub.new(:streaming_from_client, mock_method)

      Grpc::Testing::BenchmarkService::Stub.stub(:new, mock_stub) do
        client = ::BenchmarkServiceClient.new

        # Call method
        response = client.streaming_from_client([request])

        # Verify the response
        assert_equal(expected_response, response)
      end
    end

    it 'invokes streaming_from_client with error' do
      # Create request parameters
      request = {}

      # Mock Grpc layer
      mock_method = proc do |requests|
        raise custom_error
      end
      mock_stub = MockGrpcClientStub.new(:streaming_from_client, mock_method)

      Grpc::Testing::BenchmarkService::Stub.stub(:new, mock_stub) do
        client = ::BenchmarkServiceClient.new

        # Call method
        err = assert_raises Google::Gax::GaxError do
          client.streaming_from_client([request])
        end

        # Verify the GaxError wrapped the custom error that was raised.
        assert_match(custom_error.message, err.message)
      end
    end
  end

  describe 'streaming_from_server' do
    custom_error = CustomTestError.new "Custom test error for ::BenchmarkServiceClient#streaming_from_server."

    it 'invokes streaming_from_server without error' do
      # Create request parameters
      request = {}

      # Create expected grpc response
      username = "username-265713450"
      oauth_scope = "oauthScope443818668"
      expected_response = { username: username, oauth_scope: oauth_scope }
      expected_response = Google::Gax::to_proto(expected_response, Grpc::Testing::SimpleResponse)

      # Mock Grpc layer
      mock_method = proc do |request|
        [expected_response]
      end
      mock_stub = MockGrpcClientStub.new(:streaming_from_server, mock_method)

      Grpc::Testing::BenchmarkService::Stub.stub(:new, mock_stub) do
        client = ::BenchmarkServiceClient.new

        # Call method
        response = client.streaming_from_server(request)

        # Verify the response
        assert_equal(1, response.count)
        assert_equal(expected_response, response.first)
      end
    end

    it 'invokes streaming_from_server with error' do
      # Create request parameters
      request = {}

      # Mock Grpc layer
      mock_method = proc do |request|
        raise custom_error
      end
      mock_stub = MockGrpcClientStub.new(:streaming_from_server, mock_method)

      Grpc::Testing::BenchmarkService::Stub.stub(:new, mock_stub) do
        client = ::BenchmarkServiceClient.new

        # Call method
        err = assert_raises Google::Gax::GaxError do
          client.streaming_from_server(request)
        end

        # Verify the GaxError wrapped the custom error that was raised.
        assert_match(custom_error.message, err.message)
      end
    end
  end

  describe 'streaming_both_ways' do
    custom_error = CustomTestError.new "Custom test error for ::BenchmarkServiceClient#streaming_both_ways."

    it 'invokes streaming_both_ways without error' do
      # Create request parameters
      request = {}

      # Create expected grpc response
      username = "username-265713450"
      oauth_scope = "oauthScope443818668"
      expected_response = { username: username, oauth_scope: oauth_scope }
      expected_response = Google::Gax::to_proto(expected_response, Grpc::Testing::SimpleResponse)

      # Mock Grpc layer
      mock_method = proc do |requests|
        request = requests.first
        [expected_response]
      end
      mock_stub = MockGrpcClientStub.new(:streaming_both_ways, mock_method)

      Grpc::Testing::BenchmarkService::Stub.stub(:new, mock_stub) do
        client = ::BenchmarkServiceClient.new

        # Call method
        response = client.streaming_both_ways([request])

        # Verify the response
        assert_equal(1, response.count)
        assert_equal(expected_response, response.first)
      end
    end

    it 'invokes streaming_both_ways with error' do
      # Create request parameters
      request = {}

      # Mock Grpc layer
      mock_method = proc do |requests|
        raise custom_error
      end
      mock_stub = MockGrpcClientStub.new(:streaming_both_ways, mock_method)

      Grpc::Testing::BenchmarkService::Stub.stub(:new, mock_stub) do
        client = ::BenchmarkServiceClient.new

        # Call method
        err = assert_raises Google::Gax::GaxError do
          client.streaming_both_ways([request])
        end

        # Verify the GaxError wrapped the custom error that was raised.
        assert_match(custom_error.message, err.message)
      end
    end
  end
end