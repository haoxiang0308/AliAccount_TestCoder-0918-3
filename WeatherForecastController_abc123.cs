using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<WeatherForecastController> _logger;

        public WeatherForecastController(ILogger<WeatherForecastController> logger)
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
            var forecast = new WeatherForecast
            {
                Date = DateTime.Now.AddDays(id),
                TemperatureC = Random.Shared.Next(-20, 55),
                Summary = Summaries[Random.Shared.Next(Summaries.Length)]
            };

            if (forecast == null)
            {
                return NotFound();
            }

            return forecast;
        }

        [HttpPost]
        public ActionResult<WeatherForecast> Post([FromBody] WeatherForecast value)
        {
            // In a real application, you would add the new forecast to a data store
            return CreatedAtAction(nameof(Get), new { id = 1 }, value);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] WeatherForecast value)
        {
            // In a real application, you would update the forecast in a data store
            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            // In a real application, you would remove the forecast from a data store
            return NoContent();
        }
    }

    public class WeatherForecast
    {
        public DateTime Date { get; set; }
        public int TemperatureC { get; set; }
        public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
        public string? Summary { get; set; }
    }
}