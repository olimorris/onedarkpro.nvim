import React from 'react';
import { useState } from 'react';

export default function App() {
  const [count, setCount] = useState(0);
  const increment = () => setCount(count + 1);
  const decrement = () => setCount(count - 1);

  return (
    <div>
      <Count count={count} />
      <Button type="decrement" onClick={decrement} />
      <Button type="increment" onClick={increment} />
    </div>
  );
}

function Count({ count }: { count: number }) {
  return (
    <h1
      style={{
        color: count < 0 ? 'red' : 'black',
      }}
    >
      The count is currently {count}
    </h1>
  );
}

interface ButtonProps {
  type: 'increment' | 'decrement';
  onClick: () => void;
}

function Button({ type, onClick }: ButtonProps) {
  const label = type === 'increment' ? 'Increment' : 'Decrement';

  return <button onClick={onClick}>{label}</button>;
}

