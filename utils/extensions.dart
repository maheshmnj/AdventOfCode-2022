extension Case on String{
    // isuppercase
    bool isUpperCase(){
        int ascii = codeUnitAt(0);
        return ascii >= 65 && ascii <= 90;
    }
    // islowercase
    bool isLowerCase(){
        int ascii = codeUnitAt(0);
        return ascii >= 97 && ascii <= 122;
    }
}