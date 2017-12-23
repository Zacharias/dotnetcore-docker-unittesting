using System;


namespace api{

public class MyCoolSevice : IMyCoolService {


    public MyCoolSevice(){
        //constructor things
    }

    public void DoVoidThing(){
        System.Console.Write("Void Thing Activated.");
        return;
    }

    public string GiveCoolString(){
        return "Cool String Brah";
    }

}



}
