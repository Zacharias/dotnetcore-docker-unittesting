using System;


namespace api.Services {

public class MyCoolService : IMyCoolService {

    public MyCoolService(){
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
