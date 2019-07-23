Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8315972123
	for <lists+cocci@lfdr.de>; Tue, 23 Jul 2019 22:53:38 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6NKrDNN011062;
	Tue, 23 Jul 2019 22:53:13 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id CD7AD7791;
	Tue, 23 Jul 2019 22:53:13 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 0EF2D76BF
 for <cocci@systeme.lip6.fr>; Tue, 23 Jul 2019 22:53:11 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6NKqW7c022121
 for <cocci@systeme.lip6.fr>; Tue, 23 Jul 2019 22:52:32 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,300,1559512800"; d="scan'208";a="393054747"
Received: from c-73-22-29-55.hsd1.il.comcast.net (HELO hadrien) ([73.22.29.55])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 22:52:32 +0200
Date: Tue, 23 Jul 2019 15:52:30 -0500 (CDT)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Joe Perches <joe@perches.com>
In-Reply-To: <66fcdbf607d7d0bea41edb39e5579d63b62b7d84.camel@perches.com>
Message-ID: <alpine.DEB.2.21.1907231546090.2551@hadrien>
References: <7ab8957eaf9b0931a59eff6e2bd8c5169f2f6c41.1563841972.git.joe@perches.com>
 <66fcdbf607d7d0bea41edb39e5579d63b62b7d84.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 23 Jul 2019 22:53:16 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Tue, 23 Jul 2019 22:52:32 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci <cocci@systeme.lip6.fr>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cocci] [Fwd: [PATCH 1/2] string: Add stracpy and stracpy_pad
 mechanisms]
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



On Mon, 22 Jul 2019, Joe Perches wrote:

> Hello Julia.
>
> I just sent a patch to add yet another string copy mechanism.
>
> This could help avoid misuses of strscpy and strlcpy like this
> patch set:
>
> https://lore.kernel.org/lkml/cover.1562283944.git.joe@perches.com/T/
>
> A possible cocci script to do conversions could be:
>
>    $ cat str.cpy.cocci
>    @@
>    expression e1;
>    expression e2;
>    @@
>
>    - strscpy(e1, e2, sizeof(e1))
>    + stracpy(e1, e2)
>
>    @@
>    expression e1;
>    expression e2;
>    @@
>
>    - strlcpy(e1, e2, sizeof(e1))
>    + stracpy(e1, e2)
>
> This obviously does not match the style of all the
> scripts/coccinelle cocci files, but this might be
> something that could be added improved and added.
>
> This script produces:
>
> $ spatch --in-place -sp-file str.cpy.cocci .
> $ git checkout tools/
> $ git diff --shortstat
>  958 files changed, 2179 insertions(+), 2655 deletions(-)
>
> The remainder of strlcpy and strscpy uses in the
> kernel would generally have a form like:
>
> 	strlcpy(to, from, DEFINE)
>
> where DEFINE is the specified size of to
>
> Could the cocci script above be updated to find
> and correct those styles as well?

I guess it would depend on what "to" is and what DEFINE expands into.  For
example, in cpuidle-powernv.c, I see:

strlcpy(powernv_states[index].name, name, CPUIDLE_NAME_LEN);

and by poking around I see:

struct cpuidle_state {
	char		name[CPUIDLE_NAME_LEN];
	char		desc[CPUIDLE_DESC_LEN];
	...
};

So I guess this case is ok.

I will look into it.

thanks,
julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
