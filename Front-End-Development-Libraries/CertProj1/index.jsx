const { useState, useMemo } = React;

export function CurrencyConverter() {
  const [startCurrency, setStartCurrency] = useState("USD");
  const [endCurrency, setEndCurrency] = useState("USD");
  const [amount, setAmount] = useState(1);

  const currMapping = {
    USD: 1,
    EUR: 0.92,
    GBP: 0.78,
    JPY: 156.7
};

  const converted = useMemo(() => {
    console.log("Calculating...");
    const from = currMapping[startCurrency];
    let convert = {};
    for(let curr in currMapping){
      convert[curr] = ((currMapping[curr] / from) * amount).toFixed(2);
    }
    return convert;
  }, [startCurrency, amount]);

  return (
    <div>
      <input type="number"value={amount} onChange={(e) => setAmount(e.target.value)}/>
      <select onChange={(e) => setStartCurrency(e.target.value)}>
        <option>USD</option>
        <option>EUR</option>
        <option>GBP</option>
        <option>JPY</option>
      </select>
      <select onChange={(e) => setEndCurrency(e.target.value)}>
        <option>USD</option>
        <option>EUR</option>
        <option>GBP</option>
        <option>JPY</option>
      </select>
      <p>The converted amount is: <span>{converted[endCurrency]} {endCurrency}</span></p>
    </div>
    
  );
}
