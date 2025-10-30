import React, { useState } from 'react';

const Contador = () => {
  const [contador, setContador] = useState(0);

  return (
    <div>
      <h2>Contador</h2>
      <p>Valor atual: {contador}</p>
      <button onClick={() => setContador(contador + 1)}>
        Incrementar
      </button>
      <button onClick={() => setContador(contador - 1)}>
        Decrementar
      </button>
      <button onClick={() => setContador(0)}>
        Zerar
      </button>
    </div>
  );
};

export default Contador;