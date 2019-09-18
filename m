Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E4CB625A
	for <lists+cocci@lfdr.de>; Wed, 18 Sep 2019 13:39:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8IBdaEB020301;
	Wed, 18 Sep 2019 13:39:36 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 2ED6D77AA;
	Wed, 18 Sep 2019 13:39:36 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 72AA67796
 for <cocci@systeme.lip6.fr>; Wed, 18 Sep 2019 13:39:34 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8IBdXF9028056
 for <cocci@systeme.lip6.fr>; Wed, 18 Sep 2019 13:39:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E9C8218C8900;
 Wed, 18 Sep 2019 11:39:32 +0000 (UTC)
Received: from localhost (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 921F346;
 Wed, 18 Sep 2019 11:39:32 +0000 (UTC)
Date: Wed, 18 Sep 2019 12:39:31 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Markus Elfring <Markus.Elfring@web.de>
Message-ID: <20190918113931.GO3888@redhat.com>
References: <20190917114803.GB15492@redhat.com>
 <9427d75f-a9ee-cc31-904b-187df9c403c0@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9427d75f-a9ee-cc31-904b-187df9c403c0@web.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 18 Sep 2019 13:39:37 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 18 Sep 2019 13:39:34 +0200 (CEST)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Wed, 18 Sep 2019 11:39:33 +0000 (UTC)
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Compiling with OCaml 4.08
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

On Wed, Sep 18, 2019 at 12:56:30PM +0200, Markus Elfring wrote:
> > https://bugzilla.redhat.com/show_bug.cgi?id=1734855#c12
> 
> Would you like to achieve the contribution of additional
> software development resources so that more improvements
> would become possible by easier ways?

I have tried to do it myself twice and failed both times, and I don't
know anyone with the skills (and certainly not anyone who works for
me).  I and the company I work for put in a vast amount of money and
effort supporting open source software, so we know how the system
works.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
