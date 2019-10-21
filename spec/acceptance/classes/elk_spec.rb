require 'spec_helper_acceptance'

describe 'elk class' do
 context 'default_parameters' do
    let(:manifest){
        "class {'elk':}"
    }
 end
 it 'should run without errors' do
    result = apply_manifest(manifest, :catch_failures => true)
    expect(result.exit_code).to eq 2
end
