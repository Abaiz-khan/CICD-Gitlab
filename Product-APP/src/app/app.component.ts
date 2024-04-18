import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component, OnInit, inject } from '@angular/core';
import { RouterOutlet } from '@angular/router';
// import { HttpClient } from '@angular/common/http';
import { createInjectableType } from '@angular/compiler';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, CommonModule, HttpClientModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent implements OnInit {
  title = 'Product-APP';
  httpClient = inject(HttpClient);
  products: any = [];
  fetchProducts(): void {
    this.httpClient
      .get('http://57.151.27.108:8080/Products')
      .subscribe((data: any) => {
        this.products = data;
        console.log(this.products);
      });
  }
  ngOnInit(): void {
    this.fetchProducts();
  }
}
