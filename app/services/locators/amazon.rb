module Locators
    class Amazon<Base
        require 'cgi'
    
        def request_configuration
            {
                method: :get,
                url: "https://www.amazon.com/s?k=#{CGI.escape(book_name)}&i=stripbooks-intl-ship",
               # proxy_api_key: api_key
            }
        end
        def responsible?
            platform.code.to_sym==:amazon
        end      
        def extractor 
            @extractor||=Extractors::Amazon.new
        end
        def headers
            {
                # ":path"=> "/s?k=lord%20of%20the%20rings&i=stripbooks-intl-ship&ref=nb_sb_ss_ts-doa-p_1_1&crid=1GV28V957BM1W&sprefix=l%2Cstripbooks-intl-ship%2C300",
                # ":scheme"=> "https",
                 "accept"=> "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
                 "accept-encoding"=>" gzip, deflate, br",
                # "cache-control"=> "max-age=0",
                 "accept-language"=> "en-US,en;q=0.9",
              #  "cookie"=> "session-id=144-7197693-3135224; session-id-time=2082787201l; i18n-prefs=USD; sp-cdn="L5Z9:BA"; ubid-main=131-9217056-1008302; regStatus=pre-register; lc-main=en_US; aws-target-data=%7B%22support%22%3A%221%22%7D; AMCV_7742037254C95E840A4C98A6%40AdobeOrg=1585540135%7CMCIDTS%7C19326%7CMCMID%7C45212714007741555173315325488963164787%7CMCAAMLH-1670318368%7C6%7CMCAAMB-1670318368%7CRKhpRz8krg2tLO6pguXWp5olkAcUniQYPHaMWWgdJ3xzPWQmdj0y%7CMCOPTOUT-1669720768s%7CNONE%7CMCAID%7C314D015CFC1ADE9D-60001DEA070AC578%7CvVersion%7C4.4.0; aws-target-visitor-id=1669713568023-887942.37_0; skin=noskin; session-token="7JSUMtHYQS+S6/MNKI+3gTSBehnz1tayUlGq2HsXs4Lr2h5T9E9qIHNtXksw4K+pkqHnDn/SlX2eEoRMpko78C3FWvrw3h224aTHdaq6jU1qtaMGYf2QBb+yZ41jKZcCzK5RTyUjAJu6HVQDhcBAYOYwr2c1K0YuFyK/bD7cvREGgR4Ujth9xYCuEkKIRW97kOg+bMwV+bm2S/dLV1SM+0OO63Y3tKfq+VOYtkNcggQ="; csm-hit=tb:KJ64BPD2RHGGTRRYX8DN+b-7VESDQE99FW23RJXZJHQ|1670419431072&t:1670419431072&adb:adblk_no",
                # "device-memory"=>"8",
                # "downlink"=> "7.5",
                # "dpr"=> "1.25",
                # "ect"=> "4g",
                # "referer"=> "https://www.amazon.com/s?crid=3AM5AC2C1B43F&i=stripbooks-intl-ship&k=&ref=nb_sb_noss_1&sprefix=da%20vinci%20code%2Cstripbooks-intl-ship%2C181&url=search-alias%3Dstripbooks-intl-ship",
                # "rtt"=> "150",
                # "sec-ch-device-memory"=> "8",
                # "sec-ch-dpr"=> "1.25",
                # "sec-ch-ua"=> "Google Chrome";v="107", "Chromium";v="107", "Not=A?Brand";v="24",
                # "sec-ch-ua-mobile"=> "?0",
                # "sec-ch-ua-platform"=> "Windows",
                # "sec-ch-viewport-width"=>" 692",
                # "sec-fetch-dest"=> "document",
                # "sec-fetch-mode"=> "navigate",
                # "sec-fetch-site"=> "same-origin",
                # "sec-fetch-user"=> "?1",
                # "upgrade-insecure-requests"=> "1",
                "user-agent"=> "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36",
               # "viewport-width"=> "692"
            }
        end
    end
end