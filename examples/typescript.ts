let someVariable = "Hello World!";
const someConstant = "Hello World!";

console.log(someConstant);
console.log(someVariable);

enum AnEnum {
  One,
  Two,
  Three,
  Four,
}

type FuncType = (n: number) => Promise<AnEnum>;

interface AnInterface {
  prop1: AnEnum;
  prop2: string[];
  prop3: Array<number | string>;
  prop4: FuncType;
  prop5: number;
}

async function aFunction({
  prop1,
  prop4,
  prop5,
}: AnInterface): Promise<AnEnum> {
  if (prop5 > 34) {
    const result = await prop4(prop5);
    return result;
  }

  return prop1;
}

aFunction({
  prop1: AnEnum.One,
  prop2: ['a', 'b', 'c'],
  prop3: [1, 2, 'hi', 4],
  prop4: () => Promise.resolve(AnEnum.Two),
  prop5: 35,
});

export { AnEnum, aFunction };
