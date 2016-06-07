require 'rails_helper'

RSpec.describe MarsRoversServices do
  let(:service) { MarsRoversServices.new }

  it "returns pictures from Curiousity" do
    VCR.use_cassette "#curiousity_pictures" do
      curiousity       = service.curiousity_pictures
      first_curiousity = curiousity.first

      expect(curiousity.count).to eq(12)
      expect(first_curiousity[:img_src]).to eq("http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01003/opgs/edr/ncam/NRB_486532425EDR_F0481570NCAM00323M_.JPG")
      expect(first_curiousity[:earth_date]).to eq("2015-06-02")
    end
  end

  it "returns pictures from Opportunity" do
    VCR.use_cassette "#opportunity_pictures" do
      opportunity = service.opportunity_pictures
      first_opportunity = opportunity.first

      expect(opportunity.count).to eq(24)
      expect(first_opportunity[:img_src]).to eq("http://mars.nasa.gov/mer/gallery/all/1/n/950/1N212516144EDN76ACP1585L0M1-BR.JPG")
      expect(first_opportunity[:earth_date]).to eq("2006-09-27")
    end
  end

  it "returns pictures from Spirit" do
    VCR.use_cassette "#spirit_pictures" do
      spirit = service.spirit_pictures
      first_spirit = spirit.first

      expect(spirit.count).to eq(25)
      expect(first_spirit[:img_src]).to eq("http://mars.nasa.gov/mer/gallery/all/2/n/010/2N127263955EFF0224P1528L0M1-BR.JPG")
      expect(first_spirit[:earth_date]).to eq("2004-01-14")
    end
  end
end
