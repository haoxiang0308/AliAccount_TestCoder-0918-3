using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ItemsController : ControllerBase
    {
        private static readonly List<Item> _items = new List<Item>
        {
            new Item { Id = 1, Name = "Item 1", Description = "First item" },
            new Item { Id = 2, Name = "Item 2", Description = "Second item" },
            new Item { Id = 3, Name = "Item 3", Description = "Third item" }
        };

        // GET: api/items
        [HttpGet]
        public ActionResult<List<Item>> Get()
        {
            return Ok(_items);
        }

        // GET: api/items/5
        [HttpGet("{id:int}")]
        public ActionResult<Item> Get(int id)
        {
            var item = _items.FirstOrDefault(i => i.Id == id);
            if (item == null)
            {
                return NotFound();
            }
            return Ok(item);
        }

        // POST: api/items
        [HttpPost]
        public ActionResult<Item> Post([FromBody] Item item)
        {
            item.Id = _items.Count > 0 ? _items.Max(i => i.Id) + 1 : 1;
            _items.Add(item);
            return CreatedAtAction(nameof(Get), new { id = item.Id }, item);
        }

        // PUT: api/items/5
        [HttpPut("{id:int}")]
        public IActionResult Put(int id, [FromBody] Item item)
        {
            var existingItem = _items.FirstOrDefault(i => i.Id == id);
            if (existingItem == null)
            {
                return NotFound();
            }

            existingItem.Name = item.Name;
            existingItem.Description = item.Description;
            return NoContent();
        }

        // DELETE: api/items/5
        [HttpDelete("{id:int}")]
        public IActionResult Delete(int id)
        {
            var item = _items.FirstOrDefault(i => i.Id == id);
            if (item == null)
            {
                return NotFound();
            }

            _items.Remove(item);
            return NoContent();
        }
    }

    public class Item
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
    }
}
