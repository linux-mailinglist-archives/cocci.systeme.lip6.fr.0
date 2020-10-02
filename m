Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 787742814C6
	for <lists+cocci@lfdr.de>; Fri,  2 Oct 2020 16:14:10 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 092EDqp2004614;
	Fri, 2 Oct 2020 16:13:52 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 552954500;
	Fri,  2 Oct 2020 16:13:52 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B1C7E4500
 for <cocci@systeme.lip6.fr>; Fri,  2 Oct 2020 16:13:50 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 092EDo7U005693
 for <cocci@systeme.lip6.fr>; Fri, 2 Oct 2020 16:13:50 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,327,1596492000"; d="scan'208";a="360697799"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Oct 2020 16:13:50 +0200
Date: Fri, 2 Oct 2020 16:13:49 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <7bf57afe-43d6-1288-cd8b-951079a35fa9@linux.com>
Message-ID: <alpine.DEB.2.22.394.2010021612200.2707@hadrien>
References: <alpine.DEB.2.22.394.2010021600120.2707@hadrien>
 <7bf57afe-43d6-1288-cd8b-951079a35fa9@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 02 Oct 2020 16:13:53 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 02 Oct 2020 16:13:50 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] kzfree script
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



On Fri, 2 Oct 2020, Denis Efremov wrote:

> Hi,
>
> On 10/2/20 5:01 PM, Julia Lawall wrote:
> > Denis,
> >
> > In the rule proposing kzfree_sensitive, I think it would be helpful to
> > also highlight the memset line.
>
> What do you mean? It's "highlighted" in context mode. Do you mean adding
> position argument to memset call and showing this position in the warning
> messages?

Yes, that seems to be what I mean.  0-day generated a message from the
script, and I had to hunt around for the reason why it was doing that.  So
it would be nice to have the memset highlighted.  It seems that the
non-patch 0-day messages are generated from the report mode.

thanks,
julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
