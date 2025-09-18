using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class yiycdrLbQaController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<yiycdrLbQaController> _logger;

        public yiycdrLbQaController(ILogger<yiycdrLbQaController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IEnumerable<WeatherForecast> Get()
        {
            return Enumerable.Range(1, 5).Select(index => new WeatherForecast
            {
                Date = DateTime.Now.AddDays(index),
                TemperatureC = Random.Shared.Next(-20, 55),
                Summary = Summaries[Random.Shared.Next(Summaries.Length)]
            })
            .ToArray();
        }

        [HttpGet("{id}")]
        public ActionResult<WeatherForecast> Get(int id)
        {
            if (id < 1 || id > 100)
            {
                return NotFound();
            }

            return new WeatherForecast
            {
                Date = DateTime.Now.AddDays(id),
                TemperatureC = Random.Shared.Next(-20, 55),
                Summary = Summaries[Random.Shared.Next(Summaries.Length)]
            };
        }

        [HttpPost]
        public ActionResult<WeatherForecast> Post(WeatherForecast forecast)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            // In a real application, you would save to a database
            forecast.Date = DateTime.Now;
            
            return CreatedAtAction(nameof(Get), new { id = 1 }, forecast);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, WeatherForecast forecast)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != forecast.Id)
            {
                return BadRequest("ID mismatch");
            }

            // In a real application, you would update in a database
            
            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            // In a real application, you would delete from a database
            
            return NoContent();
        }
    }

    public class WeatherForecast
    {
        public int Id { get; set; }
        public DateTime Date { get; set; }
        public int TemperatureC { get; set; }
        public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
        public string? Summary { get; set; }
    }
}