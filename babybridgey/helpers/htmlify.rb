require 'sinatra/base'
require 'json'
require 'active_support/all'

module Sinatra
  module Htmlify
    def htmlify(params, p)
      "<h5 class='title'>Talent Point Bridger</h5> <p> #{full_name(params['thisUser'])} </p> <h5 class='title'>Why are they leaving?</h5><p>#{sanitise(params['whyLeaving'])}</p><h5 class='title'> Business  </h5><p>#{sanitise(params['currentSituation'])}</p><h5 class='title'> Technology </h5> <p>#{sanitise(params['whatDoTheyWant'])}</p><h5 class='title'> People </h5><p>#{sanitise(params['people'])}</p><h5 class='title'> Other notes  </h5><p>#{sanitise(params['otherNotes'])}</p><h5 class='title'>Applicant Name</h5> <p>#{p[:FirstName]} #{p[:LastName]}</p><h5 class='title'>Email Address</h5>#{p[:EmailAddress]}</p><h5 class='title'>Mobile Number</h5>#{p[:MobileNumber]}</p><h5 class='title'>Requested Salary</h5><p>" + (p[:AnnualSalary] != "" ? "#{p[:AnnualSalary]} Annually</p><p>" : "" ) + (p[:DailyRate] != nil ? "#{p[:DailyRate]} Daily</p>" : "" ) + "<h5 class='title'>Address</h5><p>#{p[:Address][0]}</p><p>#{p[:Address][1]}</p><p>#{p[:Address][2]}</p><h5 class='title'>Postcode</h5> <p>#{p[:PostCode]}</p><h5 class='title'>Job Board</h5> <p>#{media_name(params['mediaType'])}</p>"
    end

    def sanitise(string)
      string.gsub(/[\r\n\v]+/, '').gsub('"', '')
    end
  end
  helpers Htmlify
end
