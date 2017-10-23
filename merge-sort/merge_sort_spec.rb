require_relative 'merge_sort'

describe '#merge_sort' do
  subject { unsorder_array.merge_sort }
  let(:unsorder_array) { [5, 3, 12, 7, 21, 1, 6] }

  it 'returns an ascendant sorted array' do
    expect(subject).to eq [1, 3, 5, 6, 7, 12, 21]
  end
end
