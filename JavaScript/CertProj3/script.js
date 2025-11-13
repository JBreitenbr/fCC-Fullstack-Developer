const poll = new Map();
const addOption = (option) => {
  if (!option || option === "") {
    return "Option cannot be empty."};
const optionExists = poll.has(option);
if (!optionExists) {
                  poll.set(option, new Set())
                      return `Option "${option}" added to the poll.`
 };
if (optionExists) {
    return `Option "${option}" already exists.`
};
  };

const vote = (option, voterId) => {
    if (!poll.has(option)) {
        return `Option "${option}" does not exist.`
          } else {
const optionVotes = poll.get(option);
const userHasVoted = optionVotes.has(voterId);
if (userHasVoted) {
      return `Voter ${voterId} has already voted for "${option}".`
} else {
optionVotes.add(voterId);
return `Voter ${voterId} voted for "${option}".`;
}
  }
    };
const displayResults = () => {
    let resultsString = `Poll Results:\n`;
      poll.forEach((val, key) => {resultsString += `${key}: ${val.size} votes\n`
            });
return resultsString.slice(0,resultsString.length-1);
              };


addOption('Turkey');
addOption('Morocco');
addOption('Spain');

vote('Turkey', 'traveler1');
vote('Spain', 'traveler2');
vote('Morocco', 'traveler3');
vote('Morocco','traveler4')
console.log(displayResults());
