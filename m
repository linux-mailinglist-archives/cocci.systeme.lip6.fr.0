Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 510A2199081
	for <lists+cocci@lfdr.de>; Tue, 31 Mar 2020 11:12:31 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 02V9CE1A015042;
	Tue, 31 Mar 2020 11:12:14 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 0D5357823;
	Tue, 31 Mar 2020 11:12:14 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 69CB6780C
 for <cocci@systeme.lip6.fr>; Tue, 31 Mar 2020 11:12:12 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 02V9CBMG019680
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 31 Mar 2020 11:12:12 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,327,1580770800"; d="scan'208";a="344427472"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Mar 2020 11:12:11 +0200
Date: Tue, 31 Mar 2020 11:12:11 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Joe Perches <joe@perches.com>
In-Reply-To: <471262a54c6919efe62917ec2beb43e6bd45e0b1.camel@perches.com>
Message-ID: <alpine.DEB.2.21.2003311111050.3188@hadrien>
References: <f8581a548767a5d7e460816f125566fca8694aa0.camel@perches.com>
 <alpine.DEB.2.21.2003311048341.3188@hadrien>
 <471262a54c6919efe62917ec2beb43e6bd45e0b1.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 31 Mar 2020 11:12:14 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 31 Mar 2020 11:12:12 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] linux: bad logic in repetitive tests
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



On Tue, 31 Mar 2020, Joe Perches wrote:

> On Tue, 2020-03-31 at 10:50 +0200, Julia Lawall wrote:
> > On Mon, 30 Mar 2020, Joe Perches wrote:
> >
> > > There is a block of if tests against the same variable
> > > in include/linux/mtd/pfow.h that likely is defective
> > >
> > >         if (prog_status & 0x3)
> > >                 ...
> > >         else if (prog_status & 0x2)
> > >                 ...
> > >         else (prog_status & 0x1)
> > >                 ...
> > >
> > > If the first test is true the subsequent 2 tests aren't
> > > possible.
> > >
> > > Likely the first test should be something like
> > >
> > > 	if ((prog_status & 0x03) == 0x03)
> > >
> > > Is there a way for cocci to find this style of bitwise
> > > logic defect?
> >
> > I guess this occurs rarely enough that just looking for a succession of
> > bit and tests on the same variable would be good enough to narrow it down
> > to something manageable to check by hand.
>
> I suppose, but I think misuse of the and'ed bits
> by #define is the most likely defect as it's
> very difficult to verify visually.
>
> Hard to otherwise quantify.

OK, I see that the pattern of a sequence of bit ands is actually quite
common.  It should be possible to make something more automatic.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
