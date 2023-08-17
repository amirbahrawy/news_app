# News App

This Flutter app allows users to view the latest news from the News API.

## Usage

1- Launch the app on your device or simulator.

2- The app will load the latest news from the News API.

3- Click on any news article to view details.

4- Click on view website to view the article on website.

## Test Cases

### Test Case 1: Opening Home Page with Loading Indicator

**Description**: When the Home page is opened, a loading indicator is shown until the articles are loaded.

**Steps:**

1- Open the Home page.

**Expected Result:** The loading indicator is displayed until the articles are loaded

![custom_resized_81e36f8e-478b-4447-b5fd-0bbc5d7e8759](https://github.com/amirbahrawy/news_app/assets/38887148/214cb061-4b1a-4c4d-b3d8-3b1e98737845)

### Test Case 2: Error When Opening Page (Connection Error)

**Description**: When opening the Home page, if there is a connection error, an error message is displayed.

**Steps:**

1- Disable internet connectivity on the device.

2-Open the Home page.

**Expected Result:** An error message is displayed indicating the connection error and the retry button to load data again.

![custom_resized_e81c2802-d536-4b9f-b3a0-5af009a362de](https://github.com/amirbahrawy/news_app/assets/38887148/55f3c1c6-90ee-4db3-a9df-085393cd772e)

### Test Case 3: Getting News Articles without Error

**Description**: When opening the Home page, the app retrieves the latest news articles without any errors.

**Steps:**

1-Open the Home page.

2- Wait until the articles are loaded.

**Expected Result:** The app retrieves the latest news articles without any errors.

![custom_resized_c35f3824-9f4a-48eb-bf79-f42dc3068b91](https://github.com/amirbahrawy/news_app/assets/38887148/193962db-e644-47fd-87ac-7d5ca9ef359c)

### Test Case 4: Clicking on a News Article

**Description**: When clicking on a news article, the app navigates to the article details page.

**Steps:**

1-Open the Home page.

2-Click on any news article.

**Expected Result:** The app navigates to the article details page.

![custom_resized_6f5d04f3-d866-47a5-8422-c1a2976d7085](https://github.com/amirbahrawy/news_app/assets/38887148/b0ee7b07-a06b-42a6-a9e7-218ec0ff9032)

### Test Case 5: Clicking on a open website button

**Description**: When clicking on the view website button, the app opens the article in a webview.

**Steps:**

1-Open the Home page.

2-Click on any news article.

3-Click on view website button.

**Expected Result:** The app opens the article in a webview.

![custom_resized_19bde89e-6c7e-47e8-9895-2f211374f226](https://github.com/amirbahrawy/news_app/assets/38887148/70e094d7-6797-40a8-b2f6-11abfac4412c)
![custom_resized_62f6e4ec-6b85-4433-9e6e-0f9e17933d86](https://github.com/amirbahrawy/news_app/assets/38887148/cec17ef9-1e9e-4c0b-84cd-4c149f5520b8)

### Test Case 6: Click on menu button

**Description**: When clicking on the menu button, the app opens the menu.

**Steps:**

1-Open the Home page.

2-Click on the menu button.

**Expected Result:** The app opens the menu.

![custom_resized_185f1e6c-81fc-41e8-9570-8825364a3b21](https://github.com/amirbahrawy/news_app/assets/38887148/1360bf29-74cc-4c01-b62f-4613e6d8ff32)

## Examples of the inspector

![custom_resized_ed681f07-95dc-4bdb-8f8a-57c3a45f67d2](https://github.com/amirbahrawy/news_app/assets/38887148/00f781a9-5ea7-49f4-a92c-0604369d080c)
![custom_resized_80d6ee01-83de-4266-8675-97b58f1ad2b4](https://github.com/amirbahrawy/news_app/assets/38887148/6c33bded-b77e-4c5f-9e85-c757e6b5acc4)
