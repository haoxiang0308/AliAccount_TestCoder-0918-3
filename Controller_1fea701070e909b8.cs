using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace WebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SampleController : ControllerBase
    {
        // GET: api/Sample
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Sample/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return "value";
        }

        // POST: api/Sample
        [HttpPost]
        public void Post([FromBody] string value)
        {
            // Implementation here
        }

        // PUT: api/Sample/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
            // Implementation here
        }

        // DELETE: api/Sample/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            // Implementation here
        }
    }
}