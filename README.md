## Projects Showcase

This project is aimed at showing interesting blockchain-related projects. Users can share their projects, giving a link URL and some PPC/BTC addresses for donations.

### Submit a Project

To submit a project to the showcase, follow these steps:

1. Fork this repository,
2. Add your project **at the end** of `projects.json` file,
3. Add your project image at the `/imgs/projects` folder.

The image must be of those formats: **`JPG`**, **`PNG`** or **`SVG`**, and must cointain a resolution of **`600x400px`**.

Values accepted for donation are: **`PPC`** and/or **`BTC`**.

You can find an example of your project properties on the `projects.json` file itself.

If you have any question, feel free to open an issue.

The max number of tags per project is **five**.

Here is a sample of the snipped one would add to `projects.json` file:

```json
{
  "id": 10,
  "name":"My Awesome Project",
  "description":"This is my project description (keep it small).",
  "imageUrl":"1.jpg",
  "link": "http://my-project-url.com/",
  "tags": ["app", "mobile", "ios", "android", "etc"],
  "donation": [
    {
      "symbol": "PPC",
      "address": "PF1tAaz5x1HUXrCNLbtMDqcw6o5GNn4xqX"
    },
    {
      "symbol": "BTC",
      "address": "1F1tAaz5x1HUXrCNLbtMDqcw6o5GNn4xqX"
    }
  ]
}
```

### Developing / Contributing

In order to run the project locally, you must follow these steps:

1. Make sure to have Node.js installed,
2. Close this repo,
3. Run `npm install`,
4. Run `npm start` to lift server at **localhost:3333**
5. Run `npm build` to build a production version. 