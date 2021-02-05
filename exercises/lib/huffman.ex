defmodule Huffman do
  def sample do
    'the quick brown fox jumps over the lazy dog
    this is a sample text that we will use when we build
    up a table we will only handle lower case letters and
    no punctuation symbols the frequency will of course not
    represent english but it is probably not that far off'
  end

  def test() do
    sample = sample()
    huffmanTree = tree(sample)
    encode = encode_table(huffmanTree)
    #decode = decode_table(tree)
    #text = text()
    #seq = encode(text, encode)
    #decode(seq, decode)
  end

  def tree(sample) do
    freqlist = Enum.sort(freq(sample)
    huffman(freqlist)
  end

  def freq(sample) do freq(sample, []) end
  def freq([], freq) do freq end
  def freq([char | rest], freq) do
    freq(rest, update(char, freq))
  end

  def update(char, []) do [{char, 1}] end
  def update(char, [{char, n} | freq]) do
    [{char, n + 1} | freq]
  end
  def update(char, [elem | freq]) do
    [elem | update(char, freq)]
  end

  def huffman(freq) do
    sorted = Enum.sort(freq, fn({_, x}, {_, y}) -> x < y end)
    huffman_tree(sorted)
  end

  def huffman_tree([{tree, _}]), do: tree
  def huffman_tree([{a, af}, {b, bf} | rest]) do
    huffman_tree(insert({{a, b}, af + bf}, rest))
  end

  def insert({a, af}, []), do: [{a, af}]
  def insert({a, af}, [{b, bf} | rest]) when af < bf do
    [{a, af}, {b, bf} | rest]
  end
  def insert({a, af}, [{b, bf} | rest]) do
    [{b, bf} | insert({a, af}, rest)]
  end


  def encode_table(tree) do
    codes(tree, [])
  end


  def codes({a, b}, sofar) do
    as = codes(a, [0 | sofar])
    bs = codes(b, [1 | sofar])
    as ++ bs
  end
  def codes( a, code) do
    [{a, Enum.reverse(code)}]
  end
end
