Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 375B8A2B8F
	for <lists+cocci@lfdr.de>; Fri, 30 Aug 2019 02:43:14 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x7U0glv3001688;
	Fri, 30 Aug 2019 02:42:47 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1C27177A2;
	Fri, 30 Aug 2019 02:42:47 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 2268C778B
 for <cocci@systeme.lip6.fr>; Fri, 30 Aug 2019 02:42:44 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x7U0gh56010749
 for <cocci@systeme.lip6.fr>; Fri, 30 Aug 2019 02:42:43 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,445,1559512800"; d="scan'208";a="399413605"
Received: from unknown (HELO hadrien) ([101.5.32.126])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Aug 2019 02:42:39 +0200
Date: Fri, 30 Aug 2019 08:42:34 +0800 (CST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <d2f8cd31-f317-1b28-fb0a-bfb2cf689181@linux.com>
Message-ID: <alpine.DEB.2.21.1908300842060.2184@hadrien>
References: <20190825130536.14683-1-efremov@linux.com>
 <20190829171013.22956-1-efremov@linux.com>
 <d2f8cd31-f317-1b28-fb0a-bfb2cf689181@linux.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 30 Aug 2019 02:42:49 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Fri, 30 Aug 2019 02:42:43 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Markus Elfring <Markus.Elfring@web.de>, Joe Perches <joe@perches.com>,
        cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH v2] scripts: coccinelle: check for !(un)?likely
	usage
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



On Thu, 29 Aug 2019, Denis Efremov wrote:

> On 8/29/19 8:10 PM, Denis Efremov wrote:
> > This patch adds coccinelle script for detecting !likely and
> > !unlikely usage. These notations are confusing. It's better
> > to replace !likely(x) with unlikely(!x) and !unlikely(x) with
> > likely(!x) for readability.
>
> I'm not sure that this rule deserves the acceptance.
> Just to want to be sure that "!unlikely(x)" and "!likely(x)"
> are hard-readable is not only my perception and that they
> become more clear in form "likely(!x)" and "unlikely(!x)" too.

Is likely/unlikely even useful for anything once it is a subexpression?

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
