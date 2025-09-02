%Periodic Table Code

clear;
clc;

%The strategy to create the periodic table was to use vectors for each
%different category. Such as the element symbol, the atomic number, the
%atomic weight and the group number. This made it easier to match each
%element with its respective data and information.

%First, we need to initalize the symbols vector which contains all the
%symbols of each element in the periodic table. When the user inputs the
%element symbol, this is the vector that will be used to access the desired
%element.

symbolsVector = {'H', 'He', 'Li', 'Be', 'B', 'C', 'N', 'O', 'F', 'Ne',...
    'Na','Mg', 'Al', 'Si', 'P', 'S', 'Cl', 'Ar', 'K', 'Ca', 'Sc','Ti',...
    'V', 'Cr', 'Mn', 'Fe', 'Co', 'Ni', 'Cu', 'Zn', 'Ga', 'Ge', 'As',...
    'Se', 'Br', 'Kr', 'Rb', 'Sr', 'Y', 'Zr', 'Nb', 'Mo', 'Tc', 'Ru',... 
    'Rh', 'Pd', 'Ag', 'Cd', 'In', 'Sn', 'Sb', 'Te', 'I', 'Xe', 'Cs',...
    'Ba', 'La', 'Hf', 'Ta', 'W', 'Re', 'Os', 'Ir', 'Pt', 'Au', 'Hg',...
    'Tl', 'Pb', 'Bi', 'Po', 'At', 'Rn', 'Fr', 'Ra', 'Ac', 'Rf', 'Db',...
    'Sg', 'Bh', 'Hs', 'Mt', 'Ds', 'Rg', 'Cn', 'Nh', 'Fl', 'Mc', 'Lv',...
    'Ts', 'Og'};

%This is the second vector that is initialized. It holds the group number
%that each element is in.

groupNumberVector = [1, 18, 1, 2, 13, 14, 15, 16, 17, 18, 1, 2, 13, 14,...
    15, 16, 17, 18, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,...
    16, 17, 18, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,...
    17, 18, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,...
    18, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];

%This is the third vector that is initialzied, it holds the atomic number
%for each element in the symbolsVector. 

atomicNumberVector = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,...
    16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,...
    33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49,...
    50, 51, 52, 53, 54, 55, 56, 57, 72, 73, 74, 75, 76, 78, 79, 80, 81,...
    82, 83, 84, 85, 86, 87, 88, 89, 104, 105, 106, 107, 108, 109, 110,...
    111, 112, 113, 114, 115, 116, 117, 118];

%This vector contains the atomic weight of each element. 

atomicWeightVector = [1.008, 4.003, 6.941, 9.012, 10.811, 12.011, 14.007,...
    15.999, 18.998, 20.180, 22.990, 24.305, 26.982, 28.066, 30.974,...
    32.066, 35.453,39.948, 39.098, 40.078, 44.956, 47.857, 50.942,...
    51.996, 54.938,55.845, 58.933, 58.693, 63.546, 65.38, 69.723, 72.631,...
    74.922, 78.91, 79.904, 83.798, 85.468, 87.62, 8.906, 91.224, 92.906,...
    95.95, 98,907,101.07, 102.906, 106.42, 107.868, 112.414, 114.818,...
    118.711, 121.760, 127.66, 126.904, 131.293, 132.905, 137.328, 138.91,...
    178.49, 180.948, 183.84, 186.207, 190.23, 192.217, 1955.085, 196.967,...
    200.592, 204.383, 207.2, 208.980, 208.982, 209.987, 222.018, 223.020,...
    226.025, 227, 261, 262, 266, 264, 269, 278, 281, 280, 285, 286, 289,...
    289, 293, 294, 294];

%This vector is initialized to spell out the proper and full names of each
%element on the periodic table. It will be used in the graphic that pops up
%for the desired element at the end of the code.

fullNameVector = {'Hydrogen', 'Helium', 'Lithium', 'Beryllium',...
    'Boron', 'Carbon', 'Nitrogen', 'Oxygen', 'Fluorine', 'Neon','Sodium',...
    'Magnesium', 'Aluminum', 'Silicon', 'Phosphorus', 'Sulfur',...
    'Chlorine', 'Argon', 'Potassium', 'Calcium', 'Scandium','Titanium',...
    'Vanadium', 'Chromium', 'Manganese', 'Iron', 'Cobalt', 'Nickel',...
    'Copper', 'Zinc', 'Gallium', 'Germanium', 'Arsenic','Selenium',...
    'Bromine', 'Krypton', 'Rubidium', 'Strontium', 'Yttrium',...
    'Zirconium', 'Niobium', 'Molybdenum', 'Technetium', 'Ruthenium',...
    'Rhodium', 'Palladium', 'Silver', 'Cadmium', 'Indium', 'Tin',...
    'Antimony', 'Tellurium', 'Iodine', 'Xenon', 'Cesium','Barium',...
    'Lanthanum', 'Hafnium', 'Tantalum', 'Tungsten', 'Rhenium', 'Osmium',...
    'Iridium', 'Platinum', 'Gold', 'Mercury','Thallium', 'Lead',...
    'Bismuth', 'Polonium', 'Astatine', 'Radon', 'Francium', 'Radium',...
    'Actinium', 'Rutherfordium', 'Dubnium','Seaborgium', 'Bohrium',...
    'Hassium', 'Meitnerium', 'Darmstadtium', 'Roentgenium',...
    'Copernicium', 'Nihonium', 'Flerovium', 'Moscovium', 'Livermorium',...
    'Tennessine', 'Oganesson'};

%Introduce the premise and the objective of the periodic table to the user.
%These lines serve as the introductory details to the rules and how the
%periodic table works.

fprintf("This program serves as a lookup database for a periodic table!\n")

fprintf("As the user, input the name of the element that you are " + ...
    "looking and it will output the corresponding information.\n");

fprintf("This includes the atomic number, the symbol and the atomic weight");

%Initialize each variable that will store the different information
%regarding each element.

%This variable stores the atomic number
atomicNumber = '';

%This variable stores the atomic mass
atomicMass = '';

%This variable stores the group number of the element based on the periodic
%table. It corresponds to the column numbers on the actual periodic table.
groupNumber = '';

%This variable stores the classification of each element. An element is
%either a metal, non-metal, inert gas or metalloid.
category = '';

%This variable will store the number of valence electrons that the element
%has. It will help determine which element the desired element can bond
%with to acheieve a stable state.
valenceElectrons = 0;

%The condition for the while loop is that while the user input (the
%elementSymbol variable) remains empty, then the loop will continue until
%the user puts in a valid input.

while true

%This variable stores the element symbol and is initialized as an empty
%string.

elementSymbol = '';

%This variable stores the input of the user. The user will enter the
%symbol of the element and it will be used to look up all the information
%about the element.

elementSearched = input("\nEnter the symbol of the element you would " + ...
    "like to search up: ", 's');

%This loop will loop over the symbols vector and look for the symbol of the
%element entered. Then it will output the corresponding information at
%index i.

for i = 1:length(symbolsVector)
    %I used the following youtube video to learn how to compare different 
    % strings using the MATLAB built-in functions. I learned the different 
    % ways to compare elements in a cell array and why a cell array is the 
    % best to use for a vector of strings: 
    % https://youtu.be/dieXQkGXogY?si=FVf5xJIwNivcfLbL
    if strcmpi(elementSearched, symbolsVector{i})

        %This part of the code accesses all the corresponding information
        %for the desired element at index i. We can determine the atomic
        %number, the atomic mass, the group number and the full name of the
        %element. 

        elementSymbol = symbolsVector{i};
        atomicNumber = num2str(atomicNumberVector(i));
        atomicMass = num2str(atomicWeightVector(i));
        groupNumber = num2str(groupNumberVector(i));

        %The valence electron calcualtion is below. The last group number
        %is 18 and to get the number of valence electrons, we can subtract
        %18 from the group number that the desired element is in.

        valenceElectrons = 18 - groupNumberVector(i);
        fullName = fullNameVector{i};

        %The following conditional statements classify the desired element
        %based on its placement on the periodic table. They access the
        %group number at index i and the element symbol and match it up
        %with the criteria to categorize it as a metal, inert gas,
        %non-metal or metalloid.

        if groupNumberVector(i) == 1 && symbolsVector{i} == 'H'
        category = 'this element is a non-metal';

    elseif groupNumberVector(i) >= 1 && groupNumberVector(i) <= 13
        category = 'this element is a metal';

    elseif (groupNumberVector(i) == 13 && (elementSymbol == "Al" ||...
           elementSymbol == "Ga" || elementSymbol == "In"||...
           elementSymbol == "Tl" || elementSymbol == "Nh")) ||...
           (groupNumberVector(i) == 14 && (elementSymbol == "Sn" ||...
           elementSymbol == "Pb" || elementSymbol == "Fl")) ||...
           (groupNumberVector(i) == 15 && (elementSymbol == "Bi"...
           || elementSymbol == "Mc")) || (groupNumberVector(i) == 16 &&...
           elementSymbol == "Lv")

    category = 'this element is a metal';

    elseif (groupNumberVector(i) == 13 && elementSymbol == "B") ||...
            groupNumberVector(i) == 14 && (elementSymbol == "Si" ||...
            elementSymbol == "Ge") || groupNumberVector(i) == 15 &&...
            (elementSymbol == "As" || elementSymbol == "Sb") ||...
            groupNumberVector(i) == 15 && (elementSymbol == "Te" ||...
            elementSymbol == "Po")

        category = 'this element is a metalloid';

    elseif groupNumberVector(i) >= 14 && groupNumberVector(i) <= 17
        category = 'this element is a non-metal';

    elseif groupNumberVector(i) == 18
        category = 'this element is a noble gas';

        end
        break;   
    end
    
end

%This condition checks if the elementSymbol variable is empty. This means
%that the user did not put a valid value inside the variable. If it's empty
%the computer prompts the user for another variable, otherwise it continues
%in the loop.

if isempty(elementSymbol)
    fprintf("Invalid input. The element you have entered does not " + ...
        "exist on this table. Please try again.")
    continue;
end

%These few lines of code simply output the information that was accessed in
%the for loop in a methodical manner.

fprintf('Element Symbol: %s\n', elementSymbol);
fprintf('Full Name: %s\n', fullName);
fprintf('Atomic Number: %s\n', atomicNumber);
fprintf('Atomic Mass: %s\n', atomicMass);
fprintf('This element is in group %s and %s\n', groupNumber, category);

% I used this video to teach myself how to attempt to draw a square in
% MATLAB. I learned how to customize it on my own using the MATLAB and 
% MATLAB built-in functions from the MathWorks website.
%https://youtu.be/mGiq1ao6rIY?si=jXLIhDpxU_BNnsC9

% Create a figure
figure;
hold on;

% Define the position and size of the square. The x represents the x 
% coordinate of the square from the left-hand corner. The y represents the
% y coordinate of the square from the left-hand corner
x = 1;
y = 1;

%This is the sidelength of the square
sides = 4;

% This line generates random colours by using an n by 3 array
colours = rand(1, 3);

% Plot the square with random colors
rectangle('Position', [x, y, sides, sides], 'EdgeColor',...
    'k', 'FaceColor', colours);

% This chunk of code adds the information and text that is required in the
% square. It centers the element symbol and bolds the text. It places the
% atomic number and atomic mass in their respective corners. IT also places
% the full name of the desired element at the bottom. It also randomly
% generates the different colours each time an element is looked up.

text(x + 0.1, y + sides - 0.2, ['Atomic Number: ' atomicNumber],...
    'HorizontalAlignment', 'left', 'VerticalAlignment', 'top','FontName',...
    'Helvetica','FontSize',10);
text(x + sides - 0.1, y + sides - 0.2,...
    ['Atomic Mass: ' atomicMass], 'HorizontalAlignment', 'right',...
    'VerticalAlignment','top', 'FontName', 'Helvetica', 'FontSize', 10);
text(x + sides/2, y + sides/2, elementSymbol, ...
    'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle',...
    'FontSize', 20, 'FontWeight', 'bold');
text(x + sides/2, y - 0.2, fullNameVector{i},...
    'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom',...
    'FontSize', 10, 'FontWeight', 'bold');

% This function ensures that the x and y axes have the same scale and are
% equal
axis equal;
% This removes the numerical x and y axes
axis off;
% This adds the title at the top of the graphical representation or the
% square
title('Desired Element');
hold off;

%The stableElement variable is an empty string that will hold the element
%that the desired element will bond with to become stable. The count
%variable will determine the number of atoms of the element that the
%desired element needs to become stable.

stableElement = '';
count = 0;

% This next block of code is the boolean logic which determines how the 
% desired element can become stable. If the element has a certain number of
% electrons, then it will bond with a specific element. Then, it will also
% determine how many atoms of that element will be used. If the element
% cannot become stable, it is because it either already is or it is not
% possible for the element to be stable.

if valenceElectrons == 1
    stableElement = 'Hydrogen';
    count = 1;
    fprintf("This element has %d valence electrons. This means it will " + ...
    "bond with %d %s atoms to become stable\n", valenceElectrons, count,...
    stableElement);

elseif valenceElectrons == 2
    stableElement = 'Helium';
    count = 2;
    fprintf("This element has %d valence electrons. This means it will " + ...
    "bond with %d %s atoms to become stable\n", valenceElectrons, count,...
    stableElement);

elseif valenceElectrons == 3
    stableElement = 'Lithium';
    count = 3;
    fprintf("This element has %d valence electrons. This means it will " + ...
    "bond with %d %s atoms to become stable\n", valenceElectrons, count,...
    stableElement);

elseif valenceElectrons == 4
    stableElement = 'Beryllium';
    count = 2;
    fprintf("This element has %d valence electrons. This means it will " + ...
    "bond with %d %s atoms to become stable\n", valenceElectrons, count,...
    stableElement);

elseif valenceElectrons == 5
    stableElement = 'Boron';
    count = 3;
    fprintf("This element has %d valence electrons. This means it will " + ...
    "bond with %d %s atoms to become stable\n", valenceElectrons, count,...
    stableElement);

elseif valenceElectrons == 6
    stableElement = 'Carbon';
    count = 4;
    fprintf("This element has %d valence electrons. This means it will " + ...
    "bond with %d %s atoms to become stable\n", valenceElectrons, count,...
    stableElement);

elseif valenceElectrons == 7
    stableElement = 'Nitrogen';
    count = 5;
    fprintf("This element has %d valence electrons. This means it will " + ...
    "bond with %d %s atoms to become stable\n", valenceElectrons, count,...
    stableElement);

elseif valenceElectrons == 8
    stableElement = 'Oxygen';
    count = 6;
    fprintf("This element has %d valence electrons. This means it will " + ...
    "bond with %d %s atoms to become stable\n", valenceElectrons, count,...
    stableElement);

elseif valenceElectrons == 9
    stableElement = 'Fluorine';
    count = 7;
    fprintf("This element has %d valence electrons. This means it will " + ...
    "bond with %d %s atoms to become stable\n", valenceElectrons, count,...
    stableElement);

elseif valenceElectrons == 0 || valenceElectrons == 10
    fprintf('The element is already stable')

else
    fprintf("No bonds can be formed as the element exists in groups" + ...
        " 3-12. The elements that exist in these groups are metals" + ...
        " and they are highly reactive. It is beyond the scope of this" + ...
        " table to determine which elements can bond with metals to" + ...
        " make them stable.\n");
end

% Finally, this code determines if the user needs to look up another
% element. If not, then the code terminates. If they do, then the user is
% prompted to enter another element and the code continues.

answer = input("Would you like to search up another element?\n", 's');

if lower(answer) == "no"
    fprintf("Thank you for using the periodic table lookup");
    break;
end
end
