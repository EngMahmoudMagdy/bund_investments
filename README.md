# Flutter Investment Calculator

This Flutter project implements an interactive investment page, allowing users to perform various calculations related to investment maturity, total interest, annual interest, and average maturity date. The project incorporates several tools and features to enhance the user experience.

## Features

1. **Capital at Maturity Calculation:**
    - Formula: `Capital at Maturity = (Annual Yield to Maturity * Term * Amount) + Amount`
    - Users can input the Annual Yield, Term, and Amount to calculate the Capital at Maturity.

2. **Total Interest Calculation:**
    - Formula: `Total Interest = Annual Yield to Maturity * Term * Amount`
    - Users can calculate the Total Interest based on the provided parameters.

3. **Annual Interest Calculation:**
    - Formula: `Annual Interest = Amount * Annual Yield to Maturity`
    - Users can determine the Annual Interest by entering the Amount and Annual Yield.

4. **Average Maturity Date:**
    - The application calculates and displays the maturity date based on the selected term and the current date, shown in years.

## Tools and Technologies Used

- **Bloc State Management:**
    - The project utilizes the Bloc state management pattern for efficient state handling and separation of concerns.

- **Animation:**
    - Animated elements enhance the visual appeal of the investment page, providing a more engaging user experience.

- **Shimmer Loading Effect:**
    - Shimmer loading effects are employed to enhance the UI during data loading, creating a smooth transition for a better user experience.

- **Internet Connectivity Checker:**
    - The app incorporates an internet connectivity checker to inform users of their device's internet status, ensuring a seamless experience.

- **Flutter Secure Storage:**
    - Flutter Secure Storage is used to securely store sensitive data, providing a secure and reliable storage solution.

- **Clean Code Architecture:**
    - The project follows clean code principles and architecture to maintain a scalable, readable, and maintainable codebase.

## Getting Started

Follow these steps to get started with the Flutter Investment Calculator:

1. Clone the repository: `git clone https://github.com/EngMahmoudMagdy/bund_investments.git`
2. Navigate to the project directory: `cd bund_investments`
3. Run `flutter pub get` to install dependencies.
4. Launch the app using `flutter run`.

Feel free to explore and customize the project based on your specific requirements.

## Contributing

Contributions are welcome! If you find any issues or have ideas for improvements, please submit a pull request or open an issue.

## License

This project is licensed under the MIT License - see the [LICENSE](https://www.mit.edu/~amini/LICENSE.md) file for details.
