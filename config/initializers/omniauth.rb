Rails.application.config.middleware.use OmniAuth::Builder do
    if Rails.env.development? || Rails.env.test?
        provider :github, "Iv1.f295a7a9ac26535c", "b011e339642ac777a6551e659e444cab03df4014"
    else
        provider :github,
        Rails.application.credentials.github[:client_id],
        Rails.application.credentials.github[:client_secret]
    end
end
