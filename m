Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAAC105B16
	for <lists+cocci@lfdr.de>; Thu, 21 Nov 2019 21:24:34 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xALKO9uU026419;
	Thu, 21 Nov 2019 21:24:09 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 5F07477E3;
	Thu, 21 Nov 2019 21:24:09 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9BCC777CE
 for <cocci@systeme.lip6.fr>; Thu, 21 Nov 2019 14:38:20 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xALDcJlw022298
 for <cocci@systeme.lip6.fr>; Thu, 21 Nov 2019 14:38:20 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DB831B19F;
 Thu, 21 Nov 2019 13:38:18 +0000 (UTC)
Received: by unicorn.suse.cz (Postfix, from userid 1000)
 id 22A6EE03A4; Thu, 21 Nov 2019 14:38:17 +0100 (CET)
Date: Thu, 21 Nov 2019 14:38:17 +0100
From: Michal Kubecek <mkubecek@suse.cz>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20191121133817.GF29650@unicorn.suse.cz>
References: <1572076456-12463-1-git-send-email-zhang.lin16@zte.com.cn>
 <c790578751dd69fb1080b355f5847c9ea5fb0e15.camel@perches.com>
 <bc150c6a-6d3e-ff01-e40e-840e8a385bda@metux.net>
 <20191121111917.GE29650@unicorn.suse.cz>
 <20191121120733.GF5604@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121120733.GF5604@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 21 Nov 2019 21:24:10 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 21 Nov 2019 14:38:20 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Thu, 21 Nov 2019 21:24:08 +0100
Cc: jakub.kicinski@netronome.com, ast@kernel.org, natechancellor@gmail.com,
        jiang.xuexin@zte.com.cn, cocci <cocci@systeme.lip6.fr>,
        f.fainelli@gmail.com, daniel@iogearbox.net, john.fastabend@gmail.com,
        lirongqing@baidu.com, maxime.chevallier@bootlin.com,
        vivien.didelot@gmail.com, pablo@netfilter.org, wang.yi59@zte.com.cn,
        hawk@kernel.org, arnd@arndb.de, jiri@mellanox.com,
        xue.zhihong@zte.com.cn, zhanglin <zhang.lin16@zte.com.cn>,
        Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linyunsheng@huawei.com, Joe Perches <joe@perches.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net
Subject: Re: [Cocci] [PATCH] net: Zeroing the structure ethtool_wolinfo in
 ethtool_get_wol()
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

On Thu, Nov 21, 2019 at 03:07:33PM +0300, Dan Carpenter wrote:
> On Thu, Nov 21, 2019 at 12:19:17PM +0100, Michal Kubecek wrote:
> > On Thu, Nov 21, 2019 at 11:23:34AM +0100, Enrico Weigelt, metux IT consult wrote:
> > > On 26.10.19 21:40, Joe Perches wrote:
> > > > On Sat, 2019-10-26 at 15:54 +0800, zhanglin wrote:
> > > >> memset() the structure ethtool_wolinfo that has padded bytes
> > > >> but the padded bytes have not been zeroed out.
> > > > []
> > > >> diff --git a/net/core/ethtool.c b/net/core/ethtool.c
> > > > []
> > > >> @@ -1471,11 +1471,13 @@ static int ethtool_reset(struct net_device *dev, char __user *useraddr)
> > > >>  
> > > >>  static int ethtool_get_wol(struct net_device *dev, char __user *useraddr)
> > > >>  {
> > > >> -	struct ethtool_wolinfo wol = { .cmd = ETHTOOL_GWOL };
> > > >> +	struct ethtool_wolinfo wol;
> > > >>  
> > > >>  	if (!dev->ethtool_ops->get_wol)
> > > >>  		return -EOPNOTSUPP;
> > > >>  
> > > >> +	memset(&wol, 0, sizeof(struct ethtool_wolinfo));
> > > >> +	wol.cmd = ETHTOOL_GWOL;
> > > >>  	dev->ethtool_ops->get_wol(dev, &wol);
> > > >>  
> > > >>  	if (copy_to_user(useraddr, &wol, sizeof(wol)))
> > > > 
> > > > It seems likely there are more of these.
> > > > 
> > > > Is there any way for coccinelle to find them?
> > > 
> > > Just curios: is static struct initialization (on stack) something that
> > > should be avoided ? I've been under the impression that static
> > > initialization allows thinner code and gives the compiler better chance
> > > for optimizations.
> > 
> > Not in general. The (potential) problem here is that the structure has
> > padding and it is as a whole (i.e. including the padding) copied to
> > userspace. While I'm not aware of a compiler that wouldn't actually
> > initialize the whole data block including the padding in this case, the
> > C standard provides no guarantee about that so that to be sure we cannot
> > leak leftover kernel data to userspace, we need to explicitly initialize
> > the whole block.
> 
> GCC will not always initialize the struct holes.  This patch fixes a
> real bug that GCC on my system (v7.4)

Just checked (again) to be sure. No matter if the function is inlined or
not, gcc 7.4.1 initializes the structure by one movl (of 0x5) and two
movq (of 0x0), i.e. initializes all sizeof(struct ethtool_wolinfo) = 20
bytes including the padding.

One could certainly construct examples where a real life compiler would
only initialize the fields. That's why I said "in this case".

Michal Kubecek


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
