import { useState } from 'react';

// 自定义Hook: useCounter
// 接收一个初始值，默认为 0
function useCounter(initialValue = 0) {
  // 使用 useState 来管理计数器的值
  const [count, setCount] = useState(initialValue);

  // 定义修改状态的函数
  const increment = () => setCount(count + 1);
  const decrement = () => setCount(count - 1);
  const reset = () => setCount(initialValue);

  // 返回状态值和操作函数，供调用者使用
  return { count, increment, decrement, reset };
}

export default useCounter;