LOWERCASE = ("a".."z").to_a
UPPERCASE = ("A".."Z").to_a

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def rotate_list(arr)
  arr.map{ |name| puts rotate13(name) }
end

def rotate13(str)
  first_lower, second_lower = LOWERCASE[0..12], LOWERCASE[13..26]
  first_upper, second_upper = UPPERCASE[0..12], UPPERCASE[13..26]

  deciphered_str = ""

  str.chars.each do |char|
    case
      when first_lower.include?(char)
        deciphered_str << second_lower[first_lower.index(char)]
      when second_lower.include?(char)
        deciphered_str << first_lower[second_lower.index(char)]
      when first_upper.include?(char)
        deciphered_str << second_upper[first_upper.index(char)]
      when second_upper.include?(char)
        deciphered_str << first_upper[second_upper.index(char)]
      else
        deciphered_str << char
      end
  end

  deciphered_str
end

rotate_list(ENCRYPTED_PIONEERS)