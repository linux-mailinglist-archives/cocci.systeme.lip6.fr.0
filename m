Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3899E71C9C
	for <lists+cocci@lfdr.de>; Tue, 23 Jul 2019 18:14:40 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6NGBxXI029098;
	Tue, 23 Jul 2019 18:11:59 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 99DA77791;
	Tue, 23 Jul 2019 18:11:59 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A2E2F76BF
 for <cocci@systeme.lip6.fr>; Tue, 23 Jul 2019 18:11:58 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6NGBwUF007599
 for <cocci@systeme.lip6.fr>; Tue, 23 Jul 2019 18:11:58 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,299,1559512800"; d="scan'208";a="314497727"
Received: from c-73-22-29-55.hsd1.il.comcast.net (HELO hadrien) ([73.22.29.55])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 18:11:56 +0200
Date: Tue, 23 Jul 2019 11:11:54 -0500 (CDT)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: ron minnich <rminnich@gmail.com>
In-Reply-To: <CAP6exY+zaafb6os8X5uhteVMgyu2+HVL5keOs-yFWOF-QRuLrQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1907231109560.2551@hadrien>
References: <CAP6exY+zaafb6os8X5uhteVMgyu2+HVL5keOs-yFWOF-QRuLrQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 23 Jul 2019 18:12:00 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Tue, 23 Jul 2019 18:11:58 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] force usage of stdbool in C programs
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



On Tue, 23 Jul 2019, ron minnich wrote:

> I apologize if this has been asked.
>
> In the coreboot project, due to its long history, we have lots of
> conditionals and such with old school ints as conditional, and the
> question was raised about fixing this.
>
> Has this been done with spatch and is there an example I can loo for?

Quentin Lambert (added to CC) did a lot of work on this.  I don't know
where is the complete semantic patch that he developed.  The semantic
patch provided in the following commit could be useful:

2f119c7895af56ca26b8e94f4650145a4b1b0d12

julia

>
> thanks
>
> ron
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
