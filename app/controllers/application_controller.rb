class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, 'pol-emploie 20202021')
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            # header: { 'Authorization': 'Bearer <token>' }
            begin
                JWT.decode(token, 'pol-emploie 20202021', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end
end
