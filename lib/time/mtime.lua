-- Set internal clock when connected via Wifi
-- Source: https://www.freeformatter.com/epoch-timestamp-to-date-converter.html

local moduleName = ...
local TIME = {}
_G[moduleName] = TIME

mShortTime = 1546300800       -- Unix time for the 1.1.2019
mShiftTime = 0                 -- Shift time for winter/sommer

f= "is_winter_time.txt"
if (file.exists(f) and file.getcontents('is_winter_time.txt') == "true") then mShiftTime = 3600 else mShiftTime = 7200 end

function TIME.timeCompress(mTimeLong)
    return mTimeLong - mShortTime
end

function TIME.timeUncompress(mTimeShort)
    return mTimeShort + mShortTime
end

function TIME.timeStamp()
    local tm = rtctime.epoch2cal(rtctime.get() + mShiftTime)
    return(string.format("%04d/%02d/%02d %02d:%02d:%02d", tm["year"], tm["mon"], tm["day"], tm["hour"], tm["min"], tm["sec"]))
end

return TIME