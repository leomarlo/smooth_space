const GroupA = {
    'a': '111',
    'b': '0000111',
    'c': '000010',
    'd': '0000110',
    'e': '101',
    'f': '000111',
    'g': '000110',
    'h': '0000011',
    'i': '100',
    'j': '00010',
    'k': '000000',
    'l': '0000010',
    'm': '01',
    'n': '001001',
    'o': '1101',
    'p': '001001',
    'q': '001111',
    'r': '0010001',
    's': '0010000',
    't': '001110',
    'u': '1100',
    'v': '001011',
    'w': '001010',
    'x': '001101',
    'y': '001001',
    'z': '001100'
  }

  const GroupB = {
    'a': '111',
    'b': '010111',
    'c': '01000',
    'd': '010110',
    'e': '1011',
    'f': '010100',
    'g': '0110',
    'h': '010101',
    'i': '100',
    'j': '0111',
    'k': '010010',
    'l': '010011',
    'm': '001001',
    'n': '001000',
    'o': '110',
    'p': '00110',
    'q': '00111',
    'r': '001011',
    's': '001010',
    't': '00010',
    'u': '1010',
    'v': '000011',
    'w': '000010',
    'x': '00011',
    'y': '000001',
    'z': '000000'
  }

  var EnglishAlphabet = Object.keys(GroupA)

  encodingSubmitButton = document.getElementById('encoding_submit')
  tobeEncodedA = document.getElementById('tobeencoded_A')
  encodingField = document.getElementById('EncodingField')
  encodingLengthField = document.getElementById('encodingLength')
  optionA_radio = document.getElementById('groupa-radio')
  optionB_radio = document.getElementById('groupb-radio')

  function translate(text) {
    lowerText = text.toLowerCase()
    translation = ''
    newWordCharacters = ' .,!?;:'
    let len = 0
    let letterEncoding = new Object()
    for (let j=0; j<lowerText.length; j++){
      letter = lowerText[j]

      if (optionA_radio.checked) {
        letterEncoding = GroupA[letter]
      } else if (optionB_radio.checked) {
        letterEncoding = GroupB[letter]
      }
      
      if (letterEncoding){
        translation += letterEncoding
        len += letterEncoding.length;
      } else {
        if (newWordCharacters.includes(letter)){
          translation += letter
        } else {
          translation += '?'
        }
      }
      translation += ''
    }
    return {
      translation: translation,
      lengthOfEncoding: len}
  }

  encodingSubmitButton.addEventListener("click", ()=>{
    if (tobeEncodedA.value) {
      text = tobeEncodedA.value
      const encoding = translate(text)
      encodingField.innerText = encoding.translation
      encodingLengthField.innerText = encoding.lengthOfEncoding
    } else {
      encodingField.innerText = 'Sorry, there is no Text to be encoded.'
    }
  });
 