Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F34FE3307BB
	for <lists+cocci@lfdr.de>; Mon,  8 Mar 2021 06:56:04 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 1285tSwo025353;
	Mon, 8 Mar 2021 06:55:28 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E7F1677E2;
	Mon,  8 Mar 2021 06:55:27 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from osiris.lip6.fr (osiris.lip6.fr [132.227.60.30])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 421815DC3
 for <cocci@systeme.lip6.fr>; Mon,  8 Mar 2021 06:55:25 +0100 (CET)
Received: from smtprelay.hostedemail.com (smtprelay0203.hostedemail.com
 [216.40.44.203])
 by osiris.lip6.fr (8.15.2/8.15.2) with ESMTP id 1285tNxF025104
 for <cocci@systeme.lip6.fr>; Mon, 8 Mar 2021 06:55:24 +0100 (CET)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 2BDF71801AB4C
 for <cocci@systeme.lip6.fr>; Mon,  8 Mar 2021 05:38:55 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 3521118027FAC;
 Mon,  8 Mar 2021 05:38:52 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:967:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2560:2563:2682:2685:2693:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3355:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4031:4250:4321:5007:6119:7652:7903:8603:9025:10004:10400:11232:11658:11783:11914:12043:12297:12438:12555:12663:12740:12895:12986:13439:13869:13894:14181:14659:14721:21063:21080:21433:21611:21627:21740:21939:30005:30012:30054:30070:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: snake11_360cef1276ee
X-Filterd-Recvd-Size: 3958
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Mon,  8 Mar 2021 05:38:50 +0000 (UTC)
Message-ID: <dd39a6974e6cef241ecfd1014d683a42cc722366.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 07 Mar 2021 21:38:49 -0800
In-Reply-To: <alpine.DEB.2.22.394.2103072011480.2930@hadrien>
References: <053b06c47f08631675c295b5c893b90be4248347.camel@perches.com>
 <a15e5c4d-a60f-14b9-90e5-4e600771aa9d@prevas.dk>
 <a186c9d063663ac6de66db944d1925146393bec5.camel@perches.com>
 <alpine.DEB.2.22.394.2103072011480.2930@hadrien>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 08 Mar 2021 06:55:30 +0100 (CET)
X-Greylist: Delayed for 111:19:22 by milter-greylist-4.4.3 (osiris.lip6.fr
 [132.227.60.30]); Mon, 08 Mar 2021 06:55:24 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.30
Cc: LKML <linux-kernel@vger.kernel.org>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        cocci <cocci@systeme.lip6.fr>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [Cocci] linux-kernel janitorial RFP: Mark static arrays as const
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

On Sun, 2021-03-07 at 20:14 +0100, Julia Lawall wrote:
> =

> On Wed, 3 Mar 2021, Joe Perches wrote:
> =

> > On Wed, 2021-03-03 at 10:41 +0100, Rasmus Villemoes wrote:
> > > On 02/03/2021 18.42, Joe Perches wrote:
> > > > Here is a possible opportunity to reduce data usage in the kernel.
> > > > =

> > > > $ git grep -P -n '^static\s+(?!const|struct)(?:\w+\s+){1,3}\w+\s*\[=
\s*\]' drivers/ | \
> > > > =A0=A0grep -v __initdata | \
> > > > =A0=A0wc -l
> > > > 3250
> > > > =

> > > > Meaning there are ~3000 declarations of arrays with what appears to=
 be
> > > > file static const content that are not marked const.
> > > > =

> > > > So there are many static arrays that could be marked const to move =
the
> > > > compiled object code from data to text minimizing the total amount =
of
> > > > exposed r/w data.
> > > =

> > > You can add const if you like, but it will rarely change the generated
> > > code. gcc is already smart enough to take a static array whose conten=
ts
> > > are provably never modified within the TU and put it in .rodata:
> > =

> > At least some or perhaps even most of the time, true, but the gcc compi=
ler
> > from v5 through at least v10 seems inconsistent about when it does the
> > appropriate conversion.
> > =

> > See the example I posted:
> > https://lore.kernel.org/lkml/6b8b250a06a98ce42120a14824531a8641f5e8aa.c=
amel@perches.com/
> > =

> > It was a randomly chosen source file conversion btw, I had no prior
> > knowledge of whether the text/data use would change.
> > =

> > I'm unsure about clang consistently moving static but provably const ar=
rays
> > from data to text.  I rarely use clang.  At least for v11 it seems to be
> > better though.  I didn't try 10.1.
> =

> I tried the relevnt drivers in drivers/input/joystick.  I got only one
> driver that changed with gcc 9.3, which was
> drivers/input/joystick/analog.c.  It actually got larger:
> =

> original:
> =

> =A0=A0=A0text    data     bss     dec     hex filename
> =A0=A022607   10560     320   33487    82cf drivers/input/joystick/analog=
.o
> =

> after adding const:
> =

> =A0=A0=A0text    data     bss     dec     hex filename
> =A0=A022728   10816     320   33864    8448 drivers/input/joystick/analog=
.o
> =

> This was the only case where bss was not 0, but I don't know if there is a
> connection.

You really need consider using defconfig so whatever object code
does not have tracing/debugging support.

For instance, this code with defconfig and analog joystick:

Original:

$ size drivers/input/joystick/analog.o
   text	   data	    bss	    dec	    hex	filename
   8115	    261	    224	   8600	   2198	drivers/input/joystick/analog.o

with const:

$ size drivers/input/joystick/analog.o
   text	   data	    bss	    dec	    hex	filename
   8179	    201	    224	   8604	   219c	drivers/input/joystick/analog.o


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
