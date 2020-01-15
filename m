Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F5413C89A
	for <lists+cocci@lfdr.de>; Wed, 15 Jan 2020 17:00:02 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00FFxfVx024893;
	Wed, 15 Jan 2020 16:59:41 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 2E84277F7;
	Wed, 15 Jan 2020 16:59:41 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id D570177E3
 for <cocci@systeme.lip6.fr>; Wed, 15 Jan 2020 16:59:38 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00FFxXTi007206
 for <cocci@systeme.lip6.fr>; Wed, 15 Jan 2020 16:59:33 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,323,1574118000"; d="scan'208";a="431528818"
Received: from roc040r.vpn.inria.fr ([128.93.183.40])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2020 16:59:33 +0100
Date: Wed, 15 Jan 2020 16:59:33 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Oleg Nesterov <oleg@redhat.com>
In-Reply-To: <20200115155310.GA9716@redhat.com>
Message-ID: <alpine.DEB.2.21.2001151658480.5079@hadrien>
References: <20200115112540.GA18161@redhat.com>
 <alpine.DEB.2.21.2001151308380.5079@hadrien>
 <20200115153035.GA9172@redhat.com> <20200115155310.GA9716@redhat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 15 Jan 2020 16:59:41 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 15 Jan 2020 16:59:33 +0100 (CET)
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

> On 01/15, Oleg Nesterov wrote:
> >
> > Another question...
>
> Oh, and another one ;)
>
> http://coccinelle.lip6.fr/docs/main_grammar006.html mentions
> "typeof(expr/ctype)", but I failed to find any doc/example of
> how can it be used in SPL.
>
> Could you explain it?

@@
@@

- typeof(foo) x;

That is, you can match against the above code.  But there is no evaluation
of what typeof(foo) actually means.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
