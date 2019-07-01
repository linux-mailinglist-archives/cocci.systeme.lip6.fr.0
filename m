Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C2638A63
	for <lists+cocci@lfdr.de>; Fri,  7 Jun 2019 14:33:14 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x57CWfbN001682;
	Fri, 7 Jun 2019 14:32:41 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 0729E7772;
	Fri,  7 Jun 2019 14:32:41 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 3B49D776C
 for <cocci@systeme.lip6.fr>; Fri,  7 Jun 2019 14:32:39 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x57CWcR0017821
 for <cocci@systeme.lip6.fr>; Fri, 7 Jun 2019 14:32:38 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,563,1557180000"; d="scan'208";a="308522185"
Received: from vaio-julia.rsr.lip6.fr ([132.227.76.33])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jun 2019 14:32:38 +0200
Date: Fri, 7 Jun 2019 14:32:36 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <9745086a-cb39-b751-9cb4-faea0308e3a6@metux.net>
Message-ID: <alpine.DEB.2.20.1906071430450.3692@hadrien>
References: <69c34970-8b6d-a2a3-2e8b-0b6560f78505@metux.net>
 <6ebd6ec8-bcd0-3dac-8992-a6c8d9a14939@web.de>
 <alpine.DEB.2.20.1906061137570.7612@hadrien>
 <9745086a-cb39-b751-9cb4-faea0308e3a6@metux.net>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 07 Jun 2019 14:32:41 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Fri, 07 Jun 2019 14:32:38 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Markus Elfring <Markus.Elfring@web.de>, cocci@systeme.lip6.fr
Subject: Re: [Cocci] How to replace obsolete #ifdef's?
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



On Fri, 7 Jun 2019, Enrico Weigelt, metux IT consult wrote:

> On 06.06.19 11:39, Julia Lawall wrote:
>
> >> See also:
> >> https://github.com/coccinelle/coccinelle/blob/cad4c0705f9e37f501531e133d3a47bc56ed0ce2/docs/manual/cocci_syntax.tex#L1765
> >
> > To be less cryptic, Coccinelle supprorts matching and transformation for
> > #include and #define, and addition of comments pragmas and ifdefs.
>
> Could you perhaps give an quick example for a newbie ?

You can do:

@@
@@

+ #ifdef FOO
  bar();
+ #endif

but not:

@@
@@

- #ifdef FOO
  bar();
- #endif

You can also do

@@
expression e;
@@

- #define XXX e

or various other things that you may expect to be able to do with #define.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
