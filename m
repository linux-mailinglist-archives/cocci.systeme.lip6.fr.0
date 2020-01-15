Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A40013C845
	for <lists+cocci@lfdr.de>; Wed, 15 Jan 2020 16:46:01 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00FFjdfH023672;
	Wed, 15 Jan 2020 16:45:39 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8FB5D77F7;
	Wed, 15 Jan 2020 16:45:39 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 3028F77E3
 for <cocci@systeme.lip6.fr>; Wed, 15 Jan 2020 16:45:38 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00FFjWjK023636
 for <cocci@systeme.lip6.fr>; Wed, 15 Jan 2020 16:45:32 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,322,1574118000"; d="scan'208";a="431526294"
Received: from roc040r.vpn.inria.fr ([128.93.183.40])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2020 16:45:32 +0100
Date: Wed, 15 Jan 2020 16:45:32 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Oleg Nesterov <oleg@redhat.com>
In-Reply-To: <20200115153035.GA9172@redhat.com>
Message-ID: <alpine.DEB.2.21.2001151641200.5079@hadrien>
References: <20200115112540.GA18161@redhat.com>
 <alpine.DEB.2.21.2001151308380.5079@hadrien>
 <20200115153035.GA9172@redhat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 15 Jan 2020 16:45:39 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 15 Jan 2020 16:45:32 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Q: does spatch understand typeof?
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



On Wed, 15 Jan 2020, Oleg Nesterov wrote:

> On 01/15, Julia Lawall wrote:
> >
> > Yes, it doesn't currently understand typeof.  If it's a big problem, it
> > should be easy to fix.
>
> OK, thanks Julia.
>
> Another question...
>
> inc.h:
>
> 	struct TTT { int mem; } *ptr;
>
> test.c:
>
> 	#include "inc.h"
>
> 	void func(void)
> 	{
> 		ptr->mem = 0;
> 	}
>
> test.cocci:
>
> 	@r@
> 	struct TTT *p;
> 	@@
>
> 	* p->mem
>
> $ spatch --sp-file test.cocci test.c
>
> 	(ONCE) Expected tokens mem TTT
> 	Skipping: test.c
>
> I tried to play with various --.*include.* options, but nothing seems to work
> unless I add "inc.h" to the command line explicitly.

The problem is that the file filtering happens before the parsing, and it
is the parsing that finds the includes.  You can disable the file
filtering with --disable-worth-trying-opt.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
