Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B87823417C
	for <lists+cocci@lfdr.de>; Fri, 31 Jul 2020 10:48:26 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06V8mA22008267;
	Fri, 31 Jul 2020 10:48:10 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 5F3017807;
	Fri, 31 Jul 2020 10:48:10 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E832F4121
 for <cocci@systeme.lip6.fr>; Fri, 31 Jul 2020 10:48:08 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06V8m8sg027777
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 31 Jul 2020 10:48:08 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,417,1589234400"; d="scan'208";a="355689753"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 10:48:07 +0200
Date: Fri, 31 Jul 2020 10:48:07 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <dda490e5-35c8-f097-af2a-e42e7ba21ae0@linux.com>
Message-ID: <alpine.DEB.2.22.394.2007311045490.2439@hadrien>
References: <20200605204237.85055-1-efremov@linux.com>
 <20200730140751.8635-1-efremov@linux.com>
 <alpine.DEB.2.22.394.2007302235000.2548@hadrien>
 <dda490e5-35c8-f097-af2a-e42e7ba21ae0@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 31 Jul 2020 10:48:10 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 31 Jul 2020 10:48:08 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Saeed Mahameed <saeedm@mellanox.com>, cocci@systeme.lip6.fr,
        linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH v4] coccinelle: api: add kvfree script
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

> >
> > Do the checks for the opportunities for kvmalloc really belong in this
> > rule?  That issue is not mentioned in the commit log or the description of
> > the semantic patch.
>
> I added this at the last moment. It was easy enough to add it based on existing
> patterns. I will add description for this warnings. Or do you want me to single
> out this warning to a separate rule?

It seems like a different issue.  A separate rule might be better.  Also,
there is no patch variant, so if one runs the patch mode on this script,
where the patch mode is useful, then one will miss the kvmalloc
suggestions completely.  Coccicheck has a mode where is first tries patch
and then report; I think 0-day uses this.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
