StringList inventory = new StringList();

public void setup() 
{
  String[] lines = loadStrings("words.txt");
  for (int i=0; i<lines.length; i++) {
    inventory.clear();
    separate(lines[i]);
    
    //String blank = new String();
    if (inventory.size()!=0) {
      for (int k=0; k<inventory.size(); k++)
        if (inventory.get(k).length() != 0)
          if (inventory.get(k).charAt(inventory.get(k).length()-1) == ',' || inventory.get(k).charAt(inventory.get(k).length()-1) == '.')
            inventory.set(k, inventory.get(k).substring(0,inventory.get(k).length()-1));
          
        
      for (int j = 0; j < inventory.size(); j++) 
      {
        System.out.print(pigLatin(inventory.get(j))+" ");
      }
    }
    System.out.println();
  }
}
public void draw()
{
  //not used
}
public int findFirstVowel(String sWord)
  //precondition: sWord is a valid String of length greater than 0.
  //postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
  for (int i=0; i<sWord.length(); i++) {
    if (sWord.substring(i, i+1).equals("a") || 
      sWord.substring(i, i+1).equals("e") || 
      sWord.substring(i, i+1).equals("i") || 
      sWord.substring(i, i+1).equals("o") || 
      sWord.substring(i, i+1).equals("u")) {
      return i;
    }
  }
  return -1;
}

public void separate(String sWord)
  //precondition: sWord is a valid String of length greater than 0.
  //postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
  sWord = sWord.toLowerCase();
  int k=0;
  for (int l=0; l<sWord.length(); l++) {
    String blank = new String();
    if (sWord.substring(l, l+1).equals(" ") || sWord.substring(l, l+1).equals(sWord.substring(l))) {
      inventory.append(sWord.substring(k, l));
      k=l+1;
    }
  }
} 

public String pigLatin(String sWord)
  //precondition: sWord is a valid String of length greater than 0
  //postcondition: returns the pig latin equivalent of sWord
{
  if (findFirstVowel(sWord) == -1)
    return sWord + "ay";
  if (findFirstVowel(sWord)== 0)
    return sWord + "way";
  if (sWord.substring(0, 2).equals("qu"))
    return sWord.substring(2) + sWord.substring(0, 2) + "ay";
  else {
    return sWord.substring(findFirstVowel(sWord)) + sWord.substring(0, findFirstVowel(sWord)) + "ay";
  }
}