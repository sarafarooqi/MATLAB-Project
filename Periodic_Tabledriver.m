Periodic Table Code

clear;
clc;

%The strategy to create the periodic table was to use vectors for each
%different category. Such as the element symbol, the atomic number, the
%atomic weight and the group number. This made it easier to match each
%element with its respective data and information.

%First, we need to initalize the symbols vector which contains all the
%symbols of each element in the periodic table. When the user inputs the
%element symbol, this is the vector that will be used to access the 
%desired element.

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
%that each element is in. I placed this into the function groups, and I
%will be loading the function into this driver file.

groups = groupNumberVector();

%This is the third vector that is initialized, it holds the atomic number
%for each element in the symbolsVector.  I also placed this into the
%function atomicNumbers, and I will be loading and calling the
%function into this driver file.

atomicNumbers = atomicNumberVector();

%This vector contains the atomic weight of each element. This is the 
%third piece of data that I have stored in the funciton called 
% atomicWeights. I will be loading and calling this function into this 
% driver file.

atomicWeights = atomicWeightVector();

%This vector is initialized to spell out the proper and full names of 
%each element on the periodic table. It will be used in the graphic that 
%pops up for the desired element at the end of the code.

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

%Introduce the premise and the objective of the periodic table to the 
%user. These lines serve as the introductory details to the rules and 
%how the periodic table works.

fprintf("This program serves as a lookup database for a periodic table!\n")

fprintf("As the user, input the name of the element that you are " + ...
    "looking and it will output the corresponding information.\n");

fprintf("This includes the atomic number, the symbol and the atomic " + ...
    "weight");

%Initialize each variable that will store the different information
%regarding each element.

%This variable stores the atomic number
atomicNumber = '';

%This variable stores the atomic mass
atomicMass = '';

%This variable stores the group number of the element based on the 
% periodic table. It corresponds to the column numbers on the actual 
% periodic table.
groupNumber = '';

%This variable stores the classification of each element. An element is
%either a metal, non-metal, inert gas or metalloid.
category = '';

%This variable will store the number of valence electrons that the 
% element has. It will help determine which element the desired element 
% can bond with to acheieve a stable state.
valenceElectrons = 0;

%The condition for the while loop is that while the user input (the
%elementSymbol variable) remains empty, then the loop will continue
%until the user puts in a valid input.

while true

%This variable stores the element symbol and is initialized as an empty
%string.

elementSymbol = '';

%This variable stores the input of the user. The user will enter the
%symbol of the element and it will be used to look up all the information
%about the element.

elementSearched = input("\nEnter the symbol of the element you would " + ...
    "like to search up: ", 's');

%This loop will loop over the symbols vector and look for the symbol of 
%the element entered. Then it will output the corresponding information 
% at index i.

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
        atomicNumber = num2str(atomicNumbers(i));
        atomicMass = num2str(atomicWeights(i));
        groupNumber = num2str(groups(i));

        %The valence electron calcualtion is below. The last group number
        %is 18 and to get the number of valence electrons, we can subtract
        %18 from the group number that the desired element is in.

        valenceElectrons = 18 - groups(i);
        fullName = fullNameVector{i};

        %The following conditional statements classify the desired element
        %based on its placement on the periodic table. They access the
        %group number at index i and the element symbol and match it up
        %with the criteria to categorize it as a metal, inert gas,
        %non-metal or metalloid.

        if groups(i) == 1 && symbolsVector{i} == 'H'
        category = 'this element is a non-metal';

    elseif groups(i) >= 1 && groups(i) <= 13
        category = 'this element is a metal';

    elseif (groups(i) == 13 && (elementSymbol == "Al" ||...
           elementSymbol == "Ga" || elementSymbol == "In"||...
           elementSymbol == "Tl" || elementSymbol == "Nh")) ||...
           (groups(i) == 14 && (elementSymbol == "Sn" ||...
           elementSymbol == "Pb" || elementSymbol == "Fl")) ||...
           (groups(i) == 15 && (elementSymbol == "Bi"...
           || elementSymbol == "Mc")) || (groups(i) == 16 &&...
           elementSymbol == "Lv")

    category = 'this element is a metal';

    elseif (groups(i) == 13 && elementSymbol == "B") ||...
            groups(i) == 14 && (elementSymbol == "Si" ||...
            elementSymbol == "Ge") || groups(i) == 15 &&...
            (elementSymbol == "As" || elementSymbol == "Sb") ||...
            groups(i) == 15 && (elementSymbol == "Te" ||...
            elementSymbol == "Po")

        category = 'this element is a metalloid';

    elseif groups(i) >= 14 && groups(i) <= 17
        category = 'this element is a non-metal';

    elseif groups(i) == 18
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

% For colours, I taught myself the information using this video 
% https://youtu.be/wrT3nj8l3Lc?si=LY8kvwVdtRy1ZObd

% This chunk of code adds the information and text that is required in the
% square. It centers the element symbol and bolds the text. It places the
% atomic number and atomic mass in their respective corners. It also places
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
    'FontSize', 30, 'FontWeight', 'bold');
text(x + sides/2, y - 0.2, fullNameVector{i},...
    'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom',...
    'FontSize', 15, 'FontWeight', 'bold');

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

answer = input("Would you like to search up another element? Yes, or " + ...
    "no? \n", 's');

if lower(answer) == "no"
    fprintf("Thank you for using the periodic table lookup");
    break;
end
end
