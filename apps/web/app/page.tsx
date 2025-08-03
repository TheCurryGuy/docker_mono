import {prisma} from "@repo/db/client"
export const dynamic = 'force-dynamic'

export default async function Home(){
  const user = await prisma.user.findFirst();
  return <>
    {user?.username}
    {user?.password}
  </>
}