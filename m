Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8C5139D18
	for <lists+cocci@lfdr.de>; Tue, 14 Jan 2020 00:04:52 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00DN4cfe001750;
	Tue, 14 Jan 2020 00:04:38 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id EFBC577F5;
	Tue, 14 Jan 2020 00:04:37 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 0FCAF771F
 for <cocci@systeme.lip6.fr>; Tue, 14 Jan 2020 00:04:37 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00DN4abw013793
 for <cocci@systeme.lip6.fr>; Tue, 14 Jan 2020 00:04:36 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,430,1571695200"; d="scan'208";a="431165260"
Received: from abo-154-110-68.mrs.modulonet.fr (HELO hadrien) ([85.68.110.154])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 00:04:36 +0100
Date: Tue, 14 Jan 2020 00:04:36 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Timur Tabi <timur@kernel.org>
In-Reply-To: <CAOZdJXWwKUPf_4oGk4G2j438n47fntf7J0AEJd7nFbg6+pR6Qw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2001140003030.2574@hadrien>
References: <CAOZdJXU4vhqzot5EEMZ_9jAdp-Be0TTyDS-uXJVPrGs2k=c7nA@mail.gmail.com>
 <alpine.DEB.2.21.2001132332060.2574@hadrien>
 <CAOZdJXWwKUPf_4oGk4G2j438n47fntf7J0AEJd7nFbg6+pR6Qw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 14 Jan 2020 00:04:38 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 14 Jan 2020 00:04:36 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Concatenating parameters into a string
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr


On Mon, 13 Jan 2020, Timur Tabi wrote:

> On Mon, Jan 13, 2020 at 4:33 PM Julia Lawall <julia.lawall@inria.fr> wrote:
> >
> > Sorry, I don't follow what you are trying to do here.  Could you send an
> > example of the desired before after C code?  I see what you have above,
> > but I don't see the connection to the rule you have tried to write.
> >
> > I have the feeling that you will want to use some python code to do
> > something with the ##s, but I'm not sure.
>
> I'm hoping to avoid Python.
>
> I'm basically trying to recreate the ## feature of C macros.  For
> example, given:
>
> #define MACRO(a, b)   a##b
>
> I'm looking for a cocci script that replaces
>
>    x = 1 << MACRO(HELLO, _THERE);
>
> with
>
>   x = 1 << HELLO_THERE;

It might be possible to use

@@
identifier a,b;
fresh identifier x = a ## "_" ## b;
@@

- MACRO(a,b)
+ x

julia

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
