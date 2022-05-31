module UrlHelper
    def back_url
        referrer = request.env["HTTP_REFERER"]
        referrer || 'javascript:history.back()'
    end
end

