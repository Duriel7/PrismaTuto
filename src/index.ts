import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function myFunction() {
  const post = await prisma.post.update({
    where: { id: 1 },
    data: { published: true },
  });
  console.log(post);
}

myFunction()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.log(e);
    await prisma.$disconnect();
    process.exit(1);
  });
