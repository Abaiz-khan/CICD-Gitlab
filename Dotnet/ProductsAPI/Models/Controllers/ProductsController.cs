using Microsoft.AspNetCore.Mvc;
using ProductsAPI.Models;

[ApiController]
[Route("[controller]")]
public class ProductsController : ControllerBase
{
    private readonly ILogger<ProductsController> _logger;
    public ProductsController(ILogger<ProductsController> logger)
    {
        _logger = logger;
    }
    [HttpGet(Name = "products")]
    public IEnumerable<Product> GetProducts()
    {
        return new List<Product>{
            new Product{ID=1,Name="Sugar",Price=234M,Units=80},
            new Product{ID=2,Name="Milk",Price=34M,Units=80},
            new Product{ID=3,Name="Coffee",Price=24M,Units=80},
            new Product{ID=4,Name="Tea",Price=4M,Units=80},
        };
    }
}