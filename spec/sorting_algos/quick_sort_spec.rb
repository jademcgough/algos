require_relative '../../lib/sorting_algos/quick_sort'

describe "quicksort" do

  it "sorts an array" do
    array = [3,2,6,5,4,7,1,8]
    expect(quick_sort(array)).to eq [1,2,3,4,5,6,7,8]
  end

end

describe "randomized quicksort" do

  it "sorts an array" do
    array = [3,2,6,5,4,7,1,8]
    expect(randomized_quick_sort(array)).to eq [1,2,3,4,5,6,7,8]
  end

end
