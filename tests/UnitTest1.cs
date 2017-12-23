using System;
using Xunit;
using api;

namespace tests
{
    public class UnitTest1
    {

        [Fact]
        public void Test1()
        {
            var testedservice = new api.Services.MyCoolService();
            string mystring = testedservice.GiveCoolString();
            
            Assert.InRange(mystring.Length, 1, 100);
            Assert.Contains("Brah", mystring);
        }
    }
}
