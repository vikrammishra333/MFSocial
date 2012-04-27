# To change this template, choose Tools | Templates
# and open the template in the editor.

formats = {
  :dow => "%A",
  :yyyymmdd => "%Y%m%d",
  :month_and_year => "%B %Y",
  :short_ordinal => lambda { |time| time.strftime("%B #{time.day.ordinalize}") },
  :short_ordinal_2 => '%b',
  #:month_day_ordinal> '%b %e',
  :hour=> '%l',
  :hour_with_minute => '%l:%M',
  :hour_with_minute_second => '%l:%M:%S',
  :hour_with_minute_meridian => '%l:%M %P',
  :hour_with_minute_meridian_no_space => '%l:%M%P',
  :hour_with_meridian => '%l %P',
  :month_slash_date => '%-m/%-d',
  :mdy => '%-m/%-d/%Y',
  :ymd => '%Y/%m/%d',
  :full_date => '%B %-d, %Y',
  :month_name_day => '%B %-d',
  :mysql_format => '%Y-%m-%d',
  :mysql_time_format => '%H:%M:%S',
  :mysql_date_time_format => '%Y-%m-%d %H:%M:%S',
  :invoice_datetime => "%A %B %d, %Y %I:%M %p"
}

formats.each_pair do |key,val|
  Time::DATE_FORMATS[key] = val
  Date::DATE_FORMATS[key] = val
end

